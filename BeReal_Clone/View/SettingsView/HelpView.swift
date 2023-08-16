//
//  HelpView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 12/08/2023.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        VStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        Text("Help")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                    Spacer()
                }
                
                VStack {
                    VStack(spacing: 16) {
                        NavigationLink {
                            ContactUsView().navigationBarBackButtonHidden()
                        } label: {
                            ChevronButtonView(icon: "envelope", text: "Contact us")
                        }

                        ChevronButtonView(icon: "questionmark.circle", text: "Help Center")
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 50)
                }
            }
        
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
