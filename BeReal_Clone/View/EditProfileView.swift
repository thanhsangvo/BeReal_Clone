//
//  EditProfile.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 11/08/2023.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @State var width = UIScreen.main.bounds.width
    
    @State var fullname: String
    @State var username: String
    @State var bio: String
    @State var location: String

    let currentUser: User
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    
    init(currentUser: User) {
        self.currentUser = currentUser
        self._fullname = State(initialValue: currentUser.fullname)
        self._username = State(initialValue: currentUser.username ?? "")
        self._bio = State(initialValue: currentUser.bio ?? "" )
        self._location = State(initialValue: currentUser.location ?? "")
    }
    
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Cancel")
                                .foregroundColor(.white)
                        })
                        Spacer()
                        
                        Button {
                            
                            Task {
                                
                                await saveData()
                            }

                            dismiss()

                        } label: {
                            Text("Save")
                                .foregroundColor(.gray)
                        }

                    }
                    .padding(.horizontal, width * 0.05)
                    
                    Text("Edit Profile")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                }
                Spacer()
            }
            
            VStack {
                Button {
                    imagePickerPresented.toggle()
                } label: {
                    ZStack(alignment: .bottomTrailing) {
                        
                        if currentUser.profileImageUrl != nil && profileImage == nil {
                            if let profileImage = currentUser.profileImageUrl {
                                AsyncImage(url: URL(string: profileImage),scale: 0.5)
                                    .frame(width: 120, height: 120)
                                    .cornerRadius(60)
                                    .clipShape(Circle())
                                
                            }
                        }
                        
                       else if let image  = profileImage {
                            image
                                .resizable()
                                .frame(width: 120, height: 120)
                                .cornerRadius(60)
                                .clipShape(Circle())
                        }
                        else {
                            Circle()
                                .frame(width: 120, height: 120)
                                .cornerRadius(60)
                                .foregroundColor(Color(red: 152/225, green: 163/255, blue: 16/255))
                                .overlay {
                                    Text(viewModel.currentUser?.fullname.prefix(1).uppercased() ?? "No name")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 18))
                                }
                        }
                        
                        ZStack {
                            ZStack {
                                Circle()
                                    .frame(width: 34, height: 34)
                                    .foregroundColor(.black)
                                
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.black)
                                    .opacity(0.1)
                                
                            }
                            
                            Image(systemName: "camera.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 16))
                                .shadow(color: .white,radius: 1, x: 1, y: 1)
                        }
                    }
                    .sheet(isPresented: $imagePickerPresented, onDismiss: {
                        loadImage()
                    }) {
                        ImagePicker(selectedImage: $selectedImage)
                    }

                }

                // Menu
                VStack {
                    
                    HStack {
                        HStack {
                            Text("Full Name")
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .frame(width: width * 0.22)
                        
                        HStack {
                            TextField("", text: $fullname)
                                .font(.system(size: 16))
                                .placeholder(when: fullname.isEmpty) {
                                    Text(viewModel.currentUser?.fullname ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16))
                                }
                                .foregroundColor(.white)
                                .padding(.leading, width * 0.05)
                            Spacer()
                        }
                        .frame(width: width * 0.63)
                    }
                    
                    HStack {
                        HStack {
                            Text("Username")
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .frame(width: width * 0.22)
                        
                        HStack {
                            TextField("", text: $fullname)
                                .font(.system(size: 16))
                                .placeholder(when: fullname.isEmpty) {
                                    Text(viewModel.currentUser?.username ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 16))
                                }
                                .foregroundColor(.white)
                                .padding(.leading, width * 0.05)
                            Spacer()
                        }
                        .frame(width: width * 0.63)
                    }
                    
                    HStack(alignment: .top) {
                        HStack {
                            Text("Bio")
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .frame(width: width * 0.2)
                        
                        if #available(iOS 16, *) {
                            TextEditor(text: $bio)
                                .foregroundColor(.white)
                                .background(.black)
                                .scrollContentBackground(.hidden)
                                .frame(height: 100)
                                .padding(.leading, width * 0.05)
                                .overlay {
                                    VStack {
                                        HStack {
                                            Text("Bio")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 16))
                                                .zIndex(1)
                                                .padding(.top, 8)
                                                .padding(.leading, 24)
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                }
                                .padding(.top, -8)
                                .frame(width:  width * 0.63)
                        }
                        
                    }
                    
                    HStack {
                        HStack {
                            Text("Location")
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                            Spacer()
                        }
                        .frame(width: width * 0.22)
                        
                        HStack {
                            TextField("", text: $fullname)
                                .font(.system(size: 16))
                                .placeholder(when: fullname.isEmpty) {
                                    Text(viewModel.currentUser!.location ?? "")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 16))
                                }
                                .foregroundColor(.white)
                                .padding(.leading, width * 0.05)
                            Spacer()
                        }
                        .frame(width: width * 0.63)
                    }
                    
                }
                .padding(.horizontal, width * 0.05)
                .padding(.top, 24)
                
                Spacer()
            }
            .padding(.top, UIScreen.main.bounds.height * 0.07)
         
        }
    }
    
    func saveData() async {
        
        if viewModel.currentUser!.fullname != self.fullname && !self.fullname.isEmpty {
            viewModel.currentUser!.fullname = self.fullname
           await viewModel.saveUserData(data: ["fullname" : self.fullname])
        }
        
        if viewModel.currentUser!.username != self.username && !self.username.isEmpty {
            viewModel.currentUser!.username = self.username
           await viewModel.saveUserData(data: ["username" : self.username])
        }
        
        if viewModel.currentUser!.bio != self.bio && !self.bio.isEmpty {
            viewModel.currentUser!.bio = self.bio
           await viewModel.saveUserData(data: ["bio" : self.bio])
        }
        
        if viewModel.currentUser!.location != self.location && !self.location.isEmpty {
            viewModel.currentUser!.location = self.location
           await viewModel.saveUserData(data: ["location" : self.location])
        }
        
        if selectedImage != nil {
            
            viewModel.uploadProfile(image: selectedImage!) { url in
                do {
                    Task {
                        viewModel.currentUser!.profileImageUrl = url
                        await viewModel.saveUserData(data: ["profileImageUrl" : url])
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func uploadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
    
    func loadImage()  {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

//struct EditProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileView()
//    }
//}
