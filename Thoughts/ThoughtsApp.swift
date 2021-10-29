//
//  ThoughtsApp.swift
//  Thoughts
//
//  Created by Zivai Kanengomi on 2021/10/04.
//

import SwiftUI
import Firebase

@main
struct ThoughtsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
