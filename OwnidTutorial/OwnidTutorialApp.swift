//
//  OwnidTutorialApp.swift
//  OwnidTutorial
//
//  Created by Netah Eliezerov on 12/10/2022.
//

import SwiftUI
import FirebaseCore
import OwnIDFirebaseSDK

@main
struct OwnidTutorialApp: App {
    
    init() {
        FirebaseApp.configure()
        OwnID.FirebaseSDK.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
