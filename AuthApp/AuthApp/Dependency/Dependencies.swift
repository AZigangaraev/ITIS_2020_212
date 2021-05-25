//
//  Dependencies.swift
//  AuthApp
//
//  Created by Amir Teacher on 25.05.2021.
//

import Foundation
import Macaroni

class Dependencies {
    static func configure() {
        let container = Container()
        let authService = AuthService()
        container.register { authService }        
        Container.policy = .singleton(container)
    }
}
