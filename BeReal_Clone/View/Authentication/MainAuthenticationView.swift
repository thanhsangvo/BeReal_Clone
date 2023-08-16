//
//  MainAuthenticationView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 13/08/2023.
//

import SwiftUI

struct MainAuthenticationView: View {
    @State private var nameButtonClicked = false
    @State private var ageButtonClicked = false
    @State private var phoneNumberButtonClicked = false
    
    @EnvironmentObject var viewModel : AuthenticationViewModel
    
    var body: some View {
        
        NavigationView {
            if !nameButtonClicked {
                EnterNameView(name: $viewModel.name, nameButtonClicked: $nameButtonClicked)
                    .environmentObject(viewModel)
            }
            else if nameButtonClicked && !ageButtonClicked {
                EnterAgeView(name: $viewModel.name, year: $viewModel.year, ageButtonClicked: $ageButtonClicked)
                    .environmentObject(viewModel)

            }
            else if nameButtonClicked && ageButtonClicked && !phoneNumberButtonClicked {
                EnterPhoneNumberView(phoneNumberClicked: $phoneNumberButtonClicked)
                    .environmentObject(viewModel)

            }
        }
    }
}

struct MainAuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        MainAuthenticationView()
    }
}
