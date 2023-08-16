//
//  EnterCodeView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 13/08/2023.
//

import SwiftUI
import Combine

struct EnterCodeView: View {
    
    @State private var buttonActive = false
    @State private var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @EnvironmentObject var viewModel: AuthenticationViewModel

    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                VStack {
                    Text("Enter the code we sent to + \(viewModel.phoneCode)\(viewModel.phoneNumber)")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .font(.system(size: 16))
                    
                    Text(".....")
                        .foregroundColor(viewModel.otpText.isEmpty ? .gray : .black)
                        .opacity(0.8)
                        .font(.system(size: 70))
                        .padding(.top, -40)
                        .overlay {
                            TextField("", text: $viewModel.otpText)
                                .frame(width: UIScreen.main.bounds.width/3)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 24, weight: .heavy))
                                .keyboardType(.numberPad)
                                .onReceive(Just(viewModel.otpText)) { _ in
                                    limitText(6)
                                }
                        }
                        .onReceive(Just(viewModel.otpText)) { newValue in
                            let filtered = newValue.filter({Set("0123456789").contains($0)})
                            if filtered != newValue {
                                viewModel.otpText = filtered
                            }
                        }
                    Spacer()
                    
                    Text("Change the phone number")
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                        .fontWeight(.semibold)
                    Button {
                        if buttonActive {
                            Task {
                                await self.viewModel.verifyOTP()
                            }
                        }
                    } label: {
                        WhiteButtonView(txt: viewModel.otpText.count == 6 ? "Continue" : "Resend in \(timeRemaining)s", buttonActive: $buttonActive)
                    }
                    .disabled(buttonActive ? false : true)
                    .onChange(of: viewModel.otpText) { newValue in
                        if !newValue.isEmpty {
                            buttonActive = true
                        }
                        else if newValue.isEmpty {
                            buttonActive = false
                        }
                    }

                }
            }
        }.onReceive(timer) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                buttonActive = true
            }
        }
    }
    
    
    func limitText(_ upper: Int) {
        if viewModel.otpText.count > upper {
            viewModel.otpText = String(viewModel.otpText.prefix(upper))
        }
    }
}

struct EnterCodeView_Previews: PreviewProvider {
    
    static let viewModel = AuthenticationViewModel()
    
    static var previews: some View {
        EnterCodeView().environmentObject(viewModel)
    }
}
