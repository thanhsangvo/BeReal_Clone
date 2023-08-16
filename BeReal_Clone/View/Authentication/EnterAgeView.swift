//
//  EnterNameView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 13/08/2023.
//

import SwiftUI
import Combine

struct EnterAgeView: View {
    
    @Binding var name : String
    @Binding var year : Year
    @State private var buttonActive = false
    @Binding var ageButtonClicked : Bool
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
                        
                        Text("Hi \(name), when's your birthday?")
                            .fontWeight(.heavy)
                            .font(.system(size: 16))
                           
                        HStack(spacing: 4) {
                            Text("MM")
                                .foregroundColor(year.month.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : Color.black)
                                .fontWeight(.heavy)
                                .font(.system(size: 40))
                                .frame(width: 72)
                                .overlay {
                                    TextField("", text: $year.month)
                                        .font(.system(size: 40))
                                        .fontWeight(.heavy)
                                        .multilineTextAlignment(.center)
                                        .keyboardType(.numberPad)
                                        .onReceive(Just(year.month), perform: { newValue in
                                            let filtered = newValue.filter {
                                                Set("0123456789").contains($0)
                                            }
                                            
                                            if filtered != newValue {
                                                self.year.month = filtered
                                            }
                                        })
                                        .onReceive(Just(year.month)) { _ in
                                            if year.month.count > 2 {
                                                year.month = String(year.month.prefix(2))
                                            }
                                        }

                                }
                            
                            Text("DD")
                                .foregroundColor(year.day.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : Color.black)
                                .fontWeight(.heavy)
                                .font(.system(size: 40))
                                .frame(width: 58)
                                .overlay {
                                    TextField("", text: $year.day)
                                        .font(.system(size: 40))
                                        .fontWeight(.heavy)
                                        .multilineTextAlignment(.center)
                                        .keyboardType(.numberPad)
                                        .onReceive(Just(year.day), perform: { newValue in
                                            let filtered = newValue.filter {
                                                Set("0123456789").contains($0)
                                            }
                                            
                                            if filtered != newValue {
                                                self.year.day = filtered
                                            }
                                        })
                                        .onReceive(Just(year.day)) { _ in
                                            if year.day.count > 2 {
                                                year.day = String(year.day.prefix(2))
                                            }
                                        }

                                }
                            
                            Text("YYY")
                                .foregroundColor(year.year.isEmpty ? Color(red: 70/255, green: 70/255, blue: 73/255) : Color.black)
                                .fontWeight(.heavy)
                                .font(.system(size: 40))
                                .frame(width: 120)
                                .overlay {
                                    TextField("", text: $year.year)
                                        .font(.system(size: 40))
                                        .fontWeight(.heavy)
                                        .multilineTextAlignment(.center)
                                        .keyboardType(.numberPad)
                                        .onReceive(Just(year.month), perform: { newValue in
                                            let filtered = newValue.filter {
                                                Set("0123456789").contains($0)
                                            }
                                            
                                            if filtered != newValue {
                                                self.year.year = filtered
                                            }
                                        })
                                        .onReceive(Just(year.year)) { _ in
                                            if year.year.count > 4 {
                                                year.year = String(year.year.prefix(4))
                                            }
                                        }
                                    

                                }
                        }
                       
                    }
                    .foregroundColor(.white)
                    .padding(.top)

                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    Text("Only to make sure you're old enough to use BeReal")
                        .foregroundColor(Color(red: 70/255, green: 70/255, blue: 73/255))
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                    
                    Button {
                        if buttonActive {
                            ageButtonClicked = true
                        }
                        
                    } label: {
                        WhiteButtonView(txt: "Continue", buttonActive: $buttonActive)
                            .onChange(of: year.year) { newValue in
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

//struct EnterAgeView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterAgeView()
//    }
//}
