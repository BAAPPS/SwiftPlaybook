//
//  LoginView.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import SwiftUI

import SwiftUI

struct LoginView: View {
    @Environment(AuthViewModel.self) var auth

     @State private var email = "eve.holt@reqres.in"
     @State private var password = "cityslicka"

     var body: some View {
         VStack(spacing: 16) {

             TextField("Email", text: $email)
                 .textFieldStyle(.roundedBorder)

             SecureField("Password", text: $password)
                 .textFieldStyle(.roundedBorder)

             Button("Login") {
                 print("🔥 BUTTON WAS PRESSED")
                 Task {
                     await auth.login(email: email, password: password)
                 }
             }
         }
         .padding()
     }
}

#Preview {
    LoginView()
        .environment(AuthViewModel())
}

