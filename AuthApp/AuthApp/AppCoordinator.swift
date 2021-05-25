//
//  AppCoordinator.swift
//  AuthApp
//
//  Created by Amir Teacher on 25.05.2021.
//

import SwiftUI
import Combine
import Macaroni

class AppCoordinator: ObservableObject {
    @Injected private var authService: AuthService
    
    enum MainScreenState {
        case authorization
        case content
    }
    @Published var mainScreenState: MainScreenState
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        mainScreenState = .authorization
        
        authService.$isAuthorized
            .sink { [self] authorized in
                mainScreenState = authorized ? .content : .authorization
            }
            .store(in: &cancellables)
    }
    
    func authView() -> some View {
        let viewModel = AuthViewModel()
        return AuthView(viewModel: viewModel)
    }
    
    func contentView() -> some View {
        let viewModel = ContentViewModel()
        return ContentView(viewModel: viewModel)
    }
}
