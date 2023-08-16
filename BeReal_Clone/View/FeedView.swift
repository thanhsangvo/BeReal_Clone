//
//  Feed.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 09/08/2023.
//

import SwiftUI
import Kingfisher


struct FeedView: View {
    
    @Binding var mainMenu: String
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @ObservedObject var feedModel: FeedViewModel
    
    @State private var cameraViewPresented = false
    
    init(feedModel: FeedViewModel, menu: Binding<String>) {
        self.feedModel = feedModel
        self._mainMenu = menu
    }
    var body: some View {
        
        VStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ZStack {
                    
                    ScrollView {
                        VStack {
                            VStack {
                                ZStack {
                                    VStack {
                                        Image("pp") //back
                                            .resizable()
                                            .scaledToFit()
                                            .cornerRadius(5)
                                    }
                                    
                                    VStack {
                                        HStack {
                                            Image("pp") // font
                                                .resizable()
                                                .scaledToFit()
                                                .border(.black)
                                                .cornerRadius(2)
                                                .frame(width: 20, height: 40)
                                                .padding(.leading)
                                            Spacer()
                                        }
                                        .padding(.top, 18)
                                        Spacer()
                                    }
                                }
                                .frame(height: 100)
                                
                            }
                            
                            VStack {
                                Text("Add a caption")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                Text("View comment")
                                    .foregroundColor(.gray)
                                
                                HStack {
                                    Text("Enschede, Ensche • 1hr late")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12))
                                    ThreeDots(size: 3, color: .gray)
                                }
                            }
                            
                            ForEach(feedModel.beReals, id: \.backImagUrl) { bereal in
                                FeedCell(bereal: bereal, blur: feedModel.blur, viewModel: FeedCellViewModel(beReal: bereal))

                            }
                            

                        }
                        .padding(.top, 80)
                    }
                    
                    VStack {
                        VStack {
                            HStack {
                                Button {
                                    withAnimation {
                                        mainMenu = "left"
                                    }
                                } label: {
                                    Image(systemName: "person.2.fill")
                                        .foregroundColor(.white)
                                }

                                
                                Text("BeReal.")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 22))
                                
                                Spacer()
                                
                                Button {
                                    withAnimation {
                                        mainMenu = "profile"
                                    }
                                } label: {
                                    Circle()
                                        .frame(width: 35, height: 35)
                                        .cornerRadius(17)
                                        .foregroundColor(.green)
                                        .overlay {
                                            Text(viewModel.currentUser?.fullname.prefix(1).uppercased() ?? "NoName")
                                                .foregroundColor(.white)
                                                .font(.system(size: 15))
                                        }

                                    if let profileImageUrl  = viewModel.currentUser!.profileImageUrl {
                                        KFImage(URL(string: profileImageUrl))
                                            .resizable()
                                            .frame(width: 130, height: 130)
                                            .cornerRadius(75)
                                    }
                                    else {
                                        Circle()
                                            .frame(width: 130, height: 130)
                                            .cornerRadius(75)
                                            .foregroundColor(Color(red: 152/225, green: 163/255, blue: 16/255))
                                            .overlay {
                                                Text(viewModel.currentUser?.fullname.prefix(1).uppercased() ?? "No name")
                                                    .foregroundColor(Color.white)
                                                    .font(.system(size: 50))
                                            }
                                    }
                                }

                                
                            }.padding(.horizontal)
                            
                            HStack {
                                Text("My friend")
                                    .foregroundColor(.white)
                                    .fontWeight(.semibold)
                                
                                Text("Discovery")
                                    .foregroundColor(.gray)
                            }
                        }
                        Spacer()
                        
                        HStack {
                            VStack {
                                Image(systemName: "circle")
                                    .font(.system(size: 80))
                                Text("Post a late BeReal")
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(.white)
                            .padding(.bottom, 12)
                            .onTapGesture {
                                cameraViewPresented.toggle()
                            }
                        }
                    }
                }
            }
            .onAppear{
                KingfisherManager.shared.cache.clearMemoryCache()
            }
        }
        .fullScreenCover(isPresented: $cameraViewPresented) {
            
        } content: {
            CameraView(viewModel: CameraViewModel(user: AuthenticationViewModel.shared.currentUser!))
        }

    }
}

//struct FeedView_Previews: PreviewProvider {
//
//    static let viewModel = AuthenticationViewModel()
//
//    static var previews: some View {
//        FeedView(mainMenu: .constant("feed"))
//            .environmentObject(viewModel)
//    }
//}
