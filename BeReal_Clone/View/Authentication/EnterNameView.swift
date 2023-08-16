//
//  EnterNameView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 13/08/2023.
//

import SwiftUI

struct EnterNameView: View {
    
    @Binding var name : String
    @State var buttonActive = false
    @Binding var nameButtonClicked : Bool
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        Text("BeReal")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    VStack(alignment: .center, spacing: 9) {
                        
                        Text("Let's get started, what's your name?")
                            .fontWeight(.heavy)
                            .font(.system(size: 16))
                            
                        Text(name.isEmpty ? "Your name" : "")
                            .foregroundColor(Color(red: 70/255, green: 70/255, blue: 73/255))
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .frame(width: 210)
                            .overlay {
                                TextField("", text: $name)
                                    .font(.system(size: 40))
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.center)

                            }
                    }
                    .foregroundColor(.white)
                    .padding(.top)

                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    Button {
                        if buttonActive {
                            self.nameButtonClicked = true
                        } else {
                            self.buttonActive = true 
                        }
                    } label: {
                        WhiteButtonView(txt: "Continue", buttonActive: $buttonActive)
                            .onChange(of: name) { newValue in
                                if !newValue.isEmpty {
                                    buttonActive = true
                                } else if newValue.isEmpty {
                                    buttonActive = false
                                }
                            }
                    }

                }
            }
        }
    }
}

//struct EnterNameView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterNameView()
//    }
//}
