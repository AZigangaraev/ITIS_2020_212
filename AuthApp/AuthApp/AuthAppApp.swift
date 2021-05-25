//
//  AuthAppApp.swift
//  AuthApp
//
//  Created by Amir Teacher on 25.05.2021.
//

import SwiftUI

@main
struct AuthAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainScreen(coordinator: AppCoordinator())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        Dependencies.configure()
        return true
    }
}
