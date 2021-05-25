//
//  AuthService.swift
//  AuthApp
//
//  Created by Amir Teacher on 25.05.2021.
//

import Foundation
import Combine

enum AuthError: Error {
    case wrongUserNameOrPassword
}

class AuthService: ObservableObject {
    @Published var isAuthorized: Bool = false
    
    func logIn(userName: String, password: String, completion: @escaping (Error?) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            if userName == "Admin", password == "qwerty" {
                isAuthorized = true
                completion(nil)
            } else {
                completion(AuthError.wrongUserNameOrPassword)
            }
        }
    }
    
    func logOut() {
        isAuthorized = false
    }
}
