//
//  ContactUsView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 12/08/2023.
//

import SwiftUI

struct ContactUsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Text("How can we help you")
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
                    
                    VStack(spacing: 14) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 28/255))
                            
                            HStack {
                                Image(systemName: "questionmark.circle")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                
                                Text("Ask a Question")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                    
                            }
                            .padding(.horizontal, UIScreen.main.bounds.width * 0.04)
                            .frame(height: 30)
                        }
                        
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 28/255))
                            
                            HStack {
                                Image(systemName: "ladybug")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                
                                Text("Report a Problem")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                            }
                        }
                        
                        ZStack(alignment: .center) {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(height: 45)
                                .foregroundColor(Color(red: 28/255, green: 28/255, blue: 28/255))
                            
                            HStack {
                                Image(systemName: "atom")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                
                                Text("Become Beta Tester")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    Spacer()

                }
            }
        }
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
