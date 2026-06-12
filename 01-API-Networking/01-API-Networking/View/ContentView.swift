//
//  ContentView.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import SwiftUI

struct ContentView: View {
    @Environment(AuthViewModel.self) var auth
    var body: some View {
        if auth.isLoggedIn {
            UserListView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
        .environment(AuthViewModel())
    
}
