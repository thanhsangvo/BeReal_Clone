//
//  LeftMenu.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 11/08/2023.
//

import SwiftUI

struct LeftMenu: View {
    
    @State var width = UIScreen.main.bounds.width
    @State var menu = "suggestions"
    
    @Binding var mainMenu: String
    
    var body: some View {
        
        VStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                LeftMenuTopView(mainMenu: $mainMenu)
                
                if menu == "Suggestions" {
                    Suggestions()
                }
                else if menu == "Friends" {
                    FriendsView(mainMenu: $mainMenu)
                }
                else if menu == "Requests" {
                    RequestsView(mainMenu: $mainMenu)
                }
            
                
                VStack {
                    
                    Spacer()
                    
                    ZStack {
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 22)
                                    .frame(width: width * 0.7, height: 40)
                                    .foregroundColor(Color(red: 20/255, green: 20/255, blue: 20/255))
                                
                                HStack(spacing: 4) {
                                    Capsule()
                                        .frame(width: 100, height: 28)
                                        .foregroundColor(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == "Suggestions" ? 1 : 0)
                                        .overlay {
                                            
                                            Text("Suggestions")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        }
                                        .onTapGesture {
                                            menu = "Suggestions"
                                        }
                                    
                                    Capsule()
                                        .frame(width: 70, height: 28)
                                        .foregroundColor(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == "Friends" ? 1 : 0)
                                        .overlay {
                                            
                                            Text("Friends")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        }
                                        .onTapGesture {
                                            menu = "Friends"
                                        }
                                    
                                    Capsule()
                                        .frame(width: 70, height: 28)
                                        .foregroundColor(Color(red: 46/255, green: 46/255, blue: 48/255))
                                        .opacity(menu == "Requests" ? 1 : 0)
                                        .overlay {
                                            
                                            Text("Requests")
                                                .foregroundColor(.white)
                                                .font(.system(size: 14))
                                        }
                                        .onTapGesture {
                                            menu = "Requests"
                                        }
                                }
                                
                            }
                        }
                        .zIndex(1)
                        
                        LinearGradient(colors: [.black, .white.opacity(0)], startPoint: .bottom, endPoint: .top)
                            .ignoresSafeArea()
                            .frame(height: 60)
                            .opacity(0.9)
                    }
                }
            }
        }
    }
}

struct LeftMenu_Previews: PreviewProvider {
    static var previews: some View {
        LeftMenu(mainMenu: .constant("left"))
    }
}
