//
//  ContentView.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 09/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    func simpleSucces() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
    }
    
    @State var width = UIScreen.main.bounds.width
    @State var menu = "feed"
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
       
        NavigationView {
            HStack(spacing: 0) {
                LeftMenu(mainMenu: $menu)
                    .frame(width: width)
                
                FeedView(feedModel: FeedViewModel(user: viewModel.currentUser!), menu: $menu)
                    .frame(width: width)
                    .environmentObject(viewModel)
                
                ProfileView(mainMenu: $menu)
                    .frame(width: width)
            }
            .offset(x: menu == "left" ? width : 0)
            .offset(x: menu == "profile" ? -width : 0)
            .onChange(of: menu) { newValue in
                simpleSucces()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
