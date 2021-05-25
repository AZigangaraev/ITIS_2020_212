//
//  AuthView.swift
//  AuthApp
//
//  Created by Amir Teacher on 25.05.2021.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var viewModel: AuthViewModel
    @State var userName: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Log in") {
                viewModel.logIn(userName: userName, password: password)
            }
            .disabled(viewModel.state == .loading)
            .alert(
                isPresented: Binding(
                    get: {
                        if case .error = viewModel.state {
                            return true
                        }
                        return false
                    },
                    set: { _ in viewModel.hideAlert() }
                )
            ) {
                Alert(title: Text("Wrong username/password combination"), dismissButton: .cancel(Text("OK")))
            }
        }
        .padding(20)
    }
}

struct AuthView_Previews: PreviewProvider {
    static let viewModel = AuthViewModel()
    static var previews: some View {
        AuthView(viewModel: viewModel)
    }
}
