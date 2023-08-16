//
//  SelectCountryView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 13/08/2023.
//

import SwiftUI
import CountryPicker

struct EnterPhoneNumberView: View {
    
    @State private var country: Country?
    @State private var showCountryPicker = false
    @State private var buttonActive = false
    @Binding var phoneNumberClicked : Bool
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                
                VStack {
                    
                    ZStack {
                        Text("Select Country")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Button {
                                
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                            }
                            Spacer()
                        }
                    }
                    
                    VStack(alignment: .center) {
                        Text("Create your account using your number")
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .font(.system(size: 16))
                        
                        HStack {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.gray)
                                .frame(width: 75, height: 45)
                                .overlay {
                                    if let country  = country {
                                        HStack(spacing: 2) {
                                            Text("\(country.isoCode.getFlag())")
                                                .foregroundColor(.white)
                                            Text("\(country.phoneCode)")
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    self.showCountryPicker = true
                                }
                            
                            Text(viewModel.phoneNumber.isEmpty ? "Your Phone" : "")
                                .foregroundColor(Color(red: 70/255, green: 70/255, blue: 73/255))
                                .fontWeight(.heavy)
                                .font(.system(size: 40))
                                .frame(width: 220)
                                .overlay {
                                    TextField("", text: $viewModel.phoneNumber)
                                        .foregroundColor(.white)
                                        .font(.system(size: 40))
                                        .keyboardType(.numberPad)
                                }
                        }
                        Spacer()
                        
                        Text("By tapping \"Continue\", you agree to our Privacy Policy and Terms of Service. ")
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                            .multilineTextAlignment(.center)
                        
                        Button {
                            Task {
                                if let country = country {
                                   await viewModel.sendOTP(phoneCode: country.phoneCode)
                                }
                            }
                        } label: {
                            WhiteButtonView(txt: "Continue", buttonActive: $buttonActive)
                                .onChange(of: viewModel.phoneNumber) { newValue in
                                    if !newValue.isEmpty {
                                        buttonActive = true
                                    } else if newValue.isEmpty {
                                        buttonActive = false
                                    }
                                }
                        }

                            
                    }
                    .padding(.top)
                }
                
            }
            .sheet(isPresented: $showCountryPicker) {
                CountryPicker(country: $country)
                    .preferredColorScheme(.dark)
            }
            .onAppear {
                self.country = Country(phoneCode: "+84", isoCode: "VN")
            }
            .overlay {
                
                ProgressView()
                    .opacity(viewModel.isLoading ? 1 : 0)
            }
            .background {
                NavigationLink(tag: "VERIFICATION", selection: $viewModel.navigationTag) {
                    EnterCodeView()
                        .environmentObject(viewModel)
                } label: {}
                    .labelsHidden()
            }
            
            
        }
        
    }
}

//struct EnterPhoneNumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterPhoneNumberView()
//    }
//}
//
