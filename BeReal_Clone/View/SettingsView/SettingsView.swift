//
//  Settings.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 09/08/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State var width = UIScreen.main.bounds.width
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        
        NavigationView {
            VStack {
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                    
                    VStack {
                        ZStack {
                            Text("Settings")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                            
                            HStack {
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "arrow.backward")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                }

                                
                                Spacer()
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        VStack {
                            
                            NavigationLink {
                                EditProfileView(currentUser: viewModel.currentUser!)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                RoundedRectangle (cornerRadius: 16)
                                    .frame (width: UIScreen.main.bounds.width * 0.9, height: 90)
                                    . foregroundColor (.white)
                                    .opacity (0.07)
                                    .overlay  (
                                        HStack {
//                                            Image ("pp")
//                                                .resizable()
//                                                .scaledToFill()

                                            
                                            if let profileImage = viewModel.currentUser!.profileImageUrl {
                                                AsyncImage(url: URL(string: profileImage), content: ImageView)
                                                
//                                                AsyncImage(url: URL(string: profileImage),scale: 0.5)
//                                                    .frame(width: 120, height: 120)
//                                                    .frame (width: 60, height: 60)
//                                                    .cornerRadius (30)
                                                
                                            }
                                            else {
                                                Circle()
                                                    .frame(width: 60, height: 60)
                                                    .cornerRadius(30)
                                                    .foregroundColor(Color(red: 152/225, green: 163/255, blue: 16/255))
                                                    .overlay {
                                                        Text(viewModel.currentUser?.fullname.prefix(1).uppercased() ?? "No name")
                                                            .foregroundColor(Color.white)
                                                            .font(.system(size: 18))
                                                    }
                                            }
                                            
                                            VStack(alignment: .leading) {
                                                Text (viewModel.currentUser!.fullname)
                                                    .foregroundColor (.white)
                                                    .fontWeight(.semibold)
                                                    .font(.system(size: 18))
                                                
                                                Text (viewModel.currentUser!.username ?? viewModel.currentUser!.fullname.lowercased() )
                                                    .foregroundColor(.white)
                                                    .fontWeight(.semibold)
                                                    .font(.system (size: 12) )
                                            }
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.white)
                                        }
                                            .padding(.horizontal, 18)
                                    )
                            }

                            
                            VStack(spacing: 6) {
                                HStack {
                                    Text("FEATURES")
                                        .foregroundColor(.gray)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 12))
                                        .padding(.horizontal, width * 0.05)
                                    
                                    Spacer()
                                    
                                }
                                
                                NavigationLink {
                                    MemoriesView().navigationBarBackButtonHidden()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: width * 0.9, height: 45)
                                            .foregroundColor(.white)
                                            .opacity(0.07)
                                        
                                        HStack {
                                            Image(systemName: "calendar")
                                                .foregroundColor(.white)
                                            
                                            Text("Memories")
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                    }
                                }

                            }
                            .padding(.top, 12)
                            
                            VStack {
                                HStack {
                                    Text("SETTING")
                                        .foregroundColor(.gray)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 12))
                                        .padding(.horizontal, width * 0.05)
                                    
                                    Spacer()
                                }
                            }
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: width * 0.9, height: 145)
                                    .foregroundColor(.white)
                                    .opacity(0.07)
                                
                                VStack {
                                    NavigationLink {
                                        NotificationsView().navigationBarBackButtonHidden()
                                    } label: {
                                        HStack {
                                            Image(systemName: "square.and.pencil")
                                                .foregroundColor(.white)
                                            
                                            Text("Notifications")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                    }
                                    
                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .foregroundColor(.gray)
                                    
                                    NavigationLink {
                                        TimeZoneView().navigationBarBackButtonHidden()
                                    } label: {
                                        HStack {
                                            Image(systemName: "globe.europe.africa.fill")
                                                .foregroundColor(.white)
                                            
                                            Text("Time zone: Euro")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                    }
                                    
                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .foregroundColor(.gray)
                                    
                                    NavigationLink {
                                        OtherView().navigationBarBackButtonHidden()
                                    } label: {
                                        HStack {
                                            Image(systemName: "hammer.circle")
                                                .foregroundColor(.white)
                                            
                                            Text("Other")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                    }
                                    
                                }
                            }
                            
                            // settings
                            VStack {
                                HStack {
                                    Text("ABOUT")
                                        .foregroundColor(.gray)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 12))
                                        .padding(.horizontal, width * 0.05)
                                    
                                    Spacer()
                                }
                            }
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: width * 0.9, height: 145)
                                    .foregroundColor(.white)
                                    .opacity(0.07)
                                
                                VStack {
                                    NavigationLink {
                                        
                                    } label: {
                                        HStack {
                                            Image(systemName: "square.and.arrow.up")
                                                .foregroundColor(.white)
                                            
                                            Text("Share")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                    }
                                    
                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .foregroundColor(.gray)
                                    
                                    NavigationLink {
                                        
                                    } label: {
                                        HStack {
                                            Image(systemName: "star")
                                                .foregroundColor(.white)
                                            
                                            Text("Rate")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                    }
                                    
                                    Rectangle()
                                        .frame(width: width * 0.9, height: 0.3)
                                        .foregroundColor(.gray)
                                    
                                    NavigationLink {
                                        HelpView().navigationBarBackButtonHidden()
                                    } label: {
                                        HStack {
                                            Image(systemName: "lifepreserver")
                                                .foregroundColor(.white)
                                            
                                            Text("Help")
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                        .padding(.horizontal, width * 0.1)
                                        .frame(height: 30)
                                    }
                                    
                                  
                                   
                                }
                            }
                        }
                        .padding(.top)
                        
                        // LOGOUT
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: width * 0.9, height: 45)
                                .foregroundColor(.white)
                                .opacity(0.07)
                            
                            HStack {
                                Spacer()
                                
                                Button {
                                    AuthenticationViewModel.shared.signOut()
                                } label: {
                                    Text("Log Out")
                                        .foregroundColor(.red)
                                }

                                Spacer()
                            }
                            .padding(.horizontal, width * 0.1)
                            .frame(height: 30)
                        }
                        .padding(.top, 12)
                        
                        Text("Version 0.23 - Production")
                            .foregroundColor(.gray)
                            .font(.system(size: 12))
                            .padding(.top, 12)
                        
                        
                        Spacer()
                    }
                }
                .toolbar(.hidden)
            }
        }
    }
    
    @ViewBuilder
      private func ImageView(for phase: AsyncImagePhase) -> some View {
          switch phase {
          case .empty:
              ProgressView()
                  .frame(width: 60, height: 60)

          case .success(let image):
              image
                  .resizable()
                  .frame(width: 60, height: 60)
                  .aspectRatio(contentMode: .fit)
                  .cornerRadius (30)
          case .failure(let error):
              VStack(spacing: 16) {
                  Image(systemName: "xmark.octagon.fill")
                      .foregroundColor(.red)
                  Text(error.localizedDescription)
                      .multilineTextAlignment(.center)
              }
          @unknown default:
              Text("Unknown")
                  .foregroundColor(.gray)
          }
      }
}


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
