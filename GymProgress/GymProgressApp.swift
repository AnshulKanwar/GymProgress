//
//  GymProgressApp.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 08/06/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct GymProgressApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authManager = AuthManager.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                if authManager.isLoggedIn {
                    ExerciseListView()
                } else {
                    LoginView()
                }
            }
            .environmentObject(authManager)
        }
    }
}
