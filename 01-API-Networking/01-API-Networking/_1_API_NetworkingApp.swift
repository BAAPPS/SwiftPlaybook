//
//  _1_API_NetworkingApp.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import SwiftUI

@main
struct _1_API_NetworkingApp: App {
    
    @State private var auth = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(auth)
        }
    }
}
