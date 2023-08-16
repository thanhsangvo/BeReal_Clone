//
//  NotificationsView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 12/08/2023.
//

import SwiftUI

struct NotificationsView: View {
    
    @State var mentions = false
    @State var comments = false
    @State var friendRequest = false
    @State var lateBeReal = false
    @State var realMojis = false
    @State var buttonActive = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Text("Notification")
                            .fontWeight(.semibold)
                        
                        HStack {
                            
                            Button {
                                withAnimation {
                                    dismiss()
                                }
                            } label: {
                                Image(systemName: "arrow.backward")
                                    .font(.system(size: 20))
                            }

                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .foregroundColor(.white)
                
                VStack {
                    VStack(alignment: .trailing) {
                        HStack {
                            Text("On BeReal, you're in control of your push notification.")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        
                        HStack {
                            Text("You can choose the type of notifications you want to receive.")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        
                    }
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    
                    
                    VStack(spacing: 14) {
                        VStack {
                            NotificationsButtonView(icon: "person.crop.square.filled.and.at.rectangle", text: "Mentions", toggle: $mentions)
                            
                            HStack {
                                Text("Dislay mentioned you on Devsang BeReal")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                
                                Spacer()
                            }
                        }
                        
                        VStack {
                            NotificationsButtonView(icon: "bubble.left.fill", text: "Comments", toggle: $comments)
                            
                            HStack {
                                Text("Commented on your BeReal ")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                
                                Spacer()
                            }
                        }
                        
                        VStack {
                            NotificationsButtonView(icon: "person.2.fill", text: "Friend requests", toggle: $friendRequest)
                            
                            HStack {
                                Text("Commented on your BeReal ")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                
                                Spacer()
                            }
                        }
                        
                        VStack {
                            NotificationsButtonView(icon: "timer", text: "Late BeReal", toggle: $lateBeReal)
                            
                            HStack {
                                Text("Commented on your BeReal ")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                
                                Spacer()
                            }
                        }
                        
                        VStack {
                            NotificationsButtonView(icon: "face.smiling", text: "Real Mojis", toggle: $realMojis)
                            
                            HStack {
                                Text("... Reacted to your BeReal ")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .padding(.leading)
                                
                                Spacer()
                            }
                        }

                    }
                    .padding(.top)
                }
                .padding(.horizontal)
                
                VStack {
                    Spacer()
                    WhiteButtonView(txt: "Save", buttonActive: $buttonActive)
                        .onChange(of: mentions || comments || friendRequest || lateBeReal || realMojis) { newValue in
                            self.buttonActive = true
                        }
                }
                
                
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}

