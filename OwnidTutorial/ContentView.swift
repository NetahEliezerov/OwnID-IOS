//
//  ContentView.swift
//  OwnidTutorial
//
//  Created by Netah Eliezerov on 12/10/2022.
//

import SwiftUI
import Foundation
import OwnIDFirebaseSDK

struct ContentView: View {
    @State private var currentEmail = ""
    @State private var currentPassword = ""
    
    @ObservedObject var registerViewModel = MyRegisterViewModel(email: "")
    
    var body: some View {
        VStack {
            TextField("Email", text: $registerViewModel.email)
                .frame(width: 250.0)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
            
            
            HStack {
                SecureField("Password", text: $currentPassword)
                    .frame(width: 200.0)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding()
                OwnID.FirebaseSDK.createRegisterView(viewModel: registerViewModel.ownIDViewModel, email: $currentEmail)
            }
            
            Button("Log In") {
                
            }
            .padding(.top)
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
