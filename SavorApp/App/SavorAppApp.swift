//
//  SavorAppApp.swift
//  SavorApp
//
//  Created by Saurav Vidyadhara on 8/10/23.
//

import SwiftUI
import Firebase

@main
struct SavorAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
