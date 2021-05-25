//
//  MainScreen.swift
//  AuthApp
//
//  Created by Amir Teacher on 25.05.2021.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        Group {
            switch coordinator.mainScreenState {
                case .authorization:
                    coordinator.authView()
                case .content:
                    coordinator.contentView()
            }
        }
    }
}
