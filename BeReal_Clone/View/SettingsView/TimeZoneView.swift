//
//  TimeZoneView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 11/08/2023.
//

import SwiftUI

struct TimeZoneView: View {
    
    @State var area = "europe"
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Text("Time Zone")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    
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
            }
            
            VStack {
                VStack {
                    HStack {
                        Text("Select your Time Zone")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        Spacer()
                    }
                    
                    HStack {
                        Text("To receive your BeReal notification during daytime, select your time zone. When changing your time zone, your current BeReal will be deleted. You can only change time zones once a day.")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                        Spacer()
                        
                    }
                    .padding(.top, -8)
                }
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: UIScreen.main.bounds.width * 0.95, height: 190)
                            .foregroundColor(.white)
                            .opacity(0.07)
                        
                        VStack {
                            Button {
                                self.area = "Euro"
                            } label: {
                                HStack {
                                    Image(systemName: "globe.europe.africa.fill")
                                        .foregroundColor(.white)
                                    
                                    Text("Euro")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                    
                                    if area == "Euro" {
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                .frame(height: 30)
                            }
                            
                            HStack {
                                Spacer()
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                    .opacity(0.4)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            
                            Button {
                                self.area = "Americas"
                            } label: {
                                HStack {
                                    Image(systemName: "globe.europe.africa.fill")
                                        .foregroundColor(.white)
                                    
                                    Text("Americas")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                    
                                    if area == "Euro" {
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                .frame(height: 30)
                            }
                            
                            HStack {
                                Spacer()
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                    .opacity(0.4)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            
                            Button {
                                self.area = "East Asia"
                            } label: {
                                HStack {
                                    Image(systemName: "globe.europe.africa.fill")
                                        .foregroundColor(.white)
                                    
                                    Text("East Asia")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                    
                                    if area == "East Asia" {
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                .frame(height: 30)
                            }
                            
                            
                            HStack {
                                Spacer()
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 0.3)
                                    .opacity(0.4)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            
                            Button {
                                self.area = "West Asia"
                            } label: {
                                HStack {
                                    Image(systemName: "globe.europe.africa.fill")
                                        .foregroundColor(.white)
                                    
                                    Text("West Asia")
                                        .foregroundColor(.white)
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                    
                                    if area == "Euro" {
                                        Image(systemName: "checkmark.circle")
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.horizontal, UIScreen.main.bounds.width * 0.05)
                                .frame(height: 30)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 45)
                            .foregroundColor(.white)
                            .opacity(0.4)
                            .overlay {
                                Text("Save")
                                    .foregroundColor(.white)
                                    .font(.system(size: 14))
                            }
                    }
                }
                
            }
            .padding(.top, 50)
            .padding(.horizontal)

           

        }
    }
}

struct TimeZoneView_Previews: PreviewProvider {
    static var previews: some View {
        TimeZoneView()
    }
}
