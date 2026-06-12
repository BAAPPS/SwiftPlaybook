//
//  AuthViewModel.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class AuthViewModel {

    // MARK: - State
    var isLoggedIn: Bool = false
    var isLoading: Bool = false
    var errorMessage: String?

    // MARK: - Init
    init() {
        let token = TokenManager.shared.getToken()
        isLoggedIn = token != nil

        print("🧠 AuthViewModel INIT")
        print("🔐 Existing token found: \(token != nil)")
        print("📌 isLoggedIn = \(isLoggedIn)")
    }

    // MARK: - LOGIN
    func login(email: String, password: String) async {
        print("🚀 LOGIN FUNCTION CALLED")
        print("📧 Email: \(email)")
        print("🔑 Password: \(password)")

        isLoading = true
        errorMessage = nil

        do {
            print("🌐 Calling APIClient.login...")

            let token = try await APIClient.shared.login(
                email: email,
                password: password
            )

            print("✅ LOGIN SUCCESS")
            print("🎟️ Token received: \(token)")

            TokenManager.shared.saveToken(token)

            print("💾 Token saved to Keychain")

            isLoggedIn = true

            print("🔓 isLoggedIn = true")

        } catch {
            print("❌ LOGIN FAILED")
            print("⚠️ Error: \(error.localizedDescription)")

            errorMessage = "Login failed"
            isLoggedIn = false
        }

        isLoading = false
        print("🏁 LOGIN FLOW COMPLETE")
    }

    // MARK: - LOGOUT
    func logout() {
        print("🚪 LOGOUT CALLED")

        TokenManager.shared.logout()
        isLoggedIn = false

        print("🔒 User logged out")
    }
}
