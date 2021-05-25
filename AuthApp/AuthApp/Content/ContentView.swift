//
//  ContentView.swift
//  AuthApp
//
//  Created by Amir Teacher on 25.05.2021.
//

import SwiftUI

struct ContentView: View {
    let viewModel: ContentViewModel
    
    var body: some View {
        ZStack {
            Text("Hello, world!")
            VStack {
                HStack {
                    Spacer()
                    
                    Button("Log out") {
                        viewModel.logOut()
                    }
                    .padding(.trailing)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel: ContentViewModel = ContentViewModel()
    
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}
