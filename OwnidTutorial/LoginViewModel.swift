//
//  LoginViewModel.swift
//  OwnidTutorial
//
//  Created by Netah Eliezerov on 12/10/2022.
//

import Foundation

final class MyRegisterViewModel: ObservableObject {
    // MARK: OwnID
    let ownIDViewModel = OwnID.FirebaseSDK.registrationViewModel()

    init() {
     subscribe(to: ownIDViewModel.eventPublisher)
    }

     func subscribe(to eventsPublisher: OwnID.RegistrationPublisher) {
       eventsPublisher
           .sink { [unowned self] event in
               switch event {
               case .success(let event):
                   switch event {
                   // Event when user successfully
                   // finishes Skip Password
                   // in OwnID Web App
                   case .readyToRegister:
                     // If needed, ask user to enter
                     // email (mandatory) and call
                     // OwnID.FlowsSDK.RegisterView.ViewModel.
                     // register(with email: String)
                     // to finish registration
                     ownIDViewModel.register(with: email)

                   // Event when OwnID creates Firebase
                   // account and logs in user
                   case .userRegisteredAndLoggedIn:
                     // User is registered and logged in with OwnID
                     // if you need to update user's name or other info
                     // it is good place to do this by calling
                     // currentUser.createProfileChangeRequest()
                     // in Firebase
                     
                   case .loading:
                     // Display loading indicator according to your designs
                   }

               case .failure(let error):
                // Handle OwnID.CoreSDK.Error here
               }
           }
           .store(in: &bag)
   }
}
