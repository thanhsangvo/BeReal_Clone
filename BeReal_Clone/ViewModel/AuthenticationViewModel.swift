//
//  AuthenticationViewModel.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 13/08/2023.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestoreSwift

class AuthenticationViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var year = Year(day: "", month: "", year: "")
    @Published var phoneNumber = ""
    @Published var phoneCode = ""
    @Published var otpText = ""
    @Published var navigationTag: String?
    @Published var isLoading: Bool = false
    @Published var vericationCode: String = ""
    @Published var errorMessage = ""
    @Published var showAlert: Bool = false
    
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?
    
    static let shared = AuthenticationViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func sendOTP(phoneCode: String) async {
        if isLoading { return }
        
        do {
            DispatchQueue.main.async {
                
                self.isLoading = true
            }
            
            let result = try await PhoneAuthProvider.provider().verifyPhoneNumber("\(phoneCode)"+"\(phoneNumber)", uiDelegate: nil)
            DispatchQueue.main.async {
                self.isLoading = false
                self.vericationCode = result
                self.navigationTag = "VERIFICATION"
                self.phoneCode = phoneCode
                print("vericationCode: \(self.vericationCode)")
            }
        } catch  {
            handleError(error: error.localizedDescription)
        }
    }

    func handleError(error: String) {
        DispatchQueue.main.async {
            self.isLoading = false
            self.errorMessage = error
            self.showAlert.toggle()
        }
    }
    
    func verifyOTP() async {
        do {
            isLoading = true
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: vericationCode, verificationCode: otpText)
            
            let result = try await Auth.auth().signIn(with: credential)
            
            let db = Firestore.firestore()
            try await db.collection("users").document(result.user.uid).setData([
                "fullname": name,
                "date": year.date,
                "id": result.user.uid
            ])
            
            DispatchQueue.main.async { [self] in
                self.isLoading = false
                let user = result.user
                self.userSession = user
                self.currentUser = User(fullname: name, date: year.date, phone: "+\(phoneCode)"+"\(phoneNumber)")
                print(user.uid)
                
            }
        } catch  {
            handleError(error: error.localizedDescription)
            print("error")
        }
    }
    
    func fetchUser()  {
        
        guard let uid = userSession?.uid else { return }
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid)
        
        docRef.getDocument(as: User.self) { result in
            switch result {
            case .success(let user):
                self.currentUser = user
                self.errorMessage = "Error here"
            case .failure(let error):
                self.errorMessage = "Error decoding document: \(error.localizedDescription)"
            }
        }
        
//        db.collection("users").document(uid).getDocument { snapshot, err in
//
//            if let err  = err {
//                self.errorMessage = "Error getting document: \(err.localizedDescription)"
//                return
//            }
//
//            if let snapshot = snapshot {
//                   do {
//                     self.currentUser = try snapshot.data(as: User.self)
//                   }
//                   catch {
//                     print(error)
//                   }
//                 }
//            guard let user = try? snapshot?.data(as: User.self) else { return }
//        }
        
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func saveUserData(data: [String: Any]) async {
        guard let userId = userSession?.uid  else { return }
        
        do {
            let db = Firestore.firestore()
            
            try await db.collection("users").document(userId).updateData(data as [String: Any])
        } catch {
            handleError(error: error.localizedDescription)
        }
    }
    
    func uploadProfile(image: UIImage, onSuccess: @escaping(_ url: String) -> Void) {
        ImageUploader.uploadImage(image: image, type: .profile) { url in
            onSuccess(url)
        }
    }
    
}
