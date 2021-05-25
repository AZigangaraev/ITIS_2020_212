//
//  AuthViewModel.swift
//  AuthApp
//
//  Created by Amir Teacher on 25.05.2021.
//

import Foundation
import Combine
import Macaroni

class AuthViewModel: ObservableObject {
    enum State: Equatable {
        case error(String)
        case loading
        case none
    }
    @Published var state: State = .none
    @Injected private var authService: AuthService
    
    func logIn(userName: String, password: String) {
        state = .loading
        authService.logIn(userName: userName, password: password) { [self] error in
            if let error = error {
                state = .error(error.localizedDescription)
            } else {
                state = .none
            }
        }
    }
    
    func hideAlert() {
        state = .none
    }
}
