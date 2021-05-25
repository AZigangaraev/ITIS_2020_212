//
//  ContentViewModel.swift
//  AuthApp
//
//  Created by Amir Teacher on 25.05.2021.
//

import Macaroni

class ContentViewModel {
    @Injected private var authService: AuthService
    
    func logOut() {
        authService.logOut()
    }
}
