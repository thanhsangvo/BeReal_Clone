//
//  CameraViewModel.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 16/08/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore
    
class CameraViewModel: ObservableObject {
   
    @Published var user: User
    init(user: User) {
        self.user = user
    }
    
    func takePhoto(backImage: UIImage, fontImage: UIImage, completion: @escaping(String, String) -> Void) {
        ImageUploader.uploadImage(image: backImage, type: .post) { urlBackImage in
            ImageUploader.uploadImage(image: fontImage, type: .profile) { urlFontImage in
                completion(urlBackImage, urlFontImage)
            }
        }
    }
    
    func postBeReal(fontImageUrl: String, backImageUrl: String) async {
        let db = Firestore.firestore()
        let date = Date.now
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yy"
        
        let dateString = formatter.string(from: date)
        print(dateString)
        
        
        do {
            try await db.collection("post").document("\(dateString)").collection("bereals").document(user.id!)
                .setData([
                "fontImageUrl": fontImageUrl,
                "backImageUrl": backImageUrl,
                "userId": user.id!,
                "username": user.fullname
            ])
               
        } catch  {
            print(error.localizedDescription)
        }
        
    }
}
