//
//  BeReal_CloneApp.swift
//  BeReal_Clone
//
//  Created by Dev Sang on 09/08/2023.
//

import SwiftUI
import FirebaseCore

@main
struct BeReal_CloneApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            CameraView(viewModel: CameraViewModel(user: AuthenticationViewModel.shared.currentUser!))
//            MainView()
//                .environmentObject(AuthenticationViewModel.shared)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      
    FirebaseApp.configure()

    return true
  }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) async -> UIBackgroundFetchResult {
        return .noData
    }
}
