//
//  OtherView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 12/08/2023.
//

import SwiftUI

struct OtherView: View {
    
    @State var fastCamera = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Text("Other")
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
                
                Spacer()
                
                VStack {
                    VStack(spacing: 14) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 28/255))
                            
                            HStack {
                                Image(systemName: "camera.viewfinder")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                
                                Text("Fast Camera (reduce quality)")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    
                                
                                Toggle("",isOn: $fastCamera)
                                    
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                    
                    
                    VStack(spacing: 14) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 28/255))
                            
                            HStack {
                                Image(systemName: "xmark.app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                
                                Text("Clear cache")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    
                                
                                Toggle("",isOn: $fastCamera)
                                    
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    VStack(spacing: 14) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 28/255))
                            
                            HStack {
                                
                                Text("Delete Account")
                                    .foregroundColor(.red)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    
                                
                                    
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
        }
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView()
    }
}
