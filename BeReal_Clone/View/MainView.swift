//
//  MainView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 14/08/2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        
        Group {
            if viewModel.userSession == nil {
                MainAuthenticationView()
                    .environmentObject(viewModel)
            }
            else {
                
                if viewModel.currentUser != nil {

                    ContentView()
                        .environmentObject(viewModel)
                }
                else {
                    ProgressView {
                        
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
