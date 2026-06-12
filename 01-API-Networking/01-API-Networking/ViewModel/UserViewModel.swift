//
//  UserViewModel.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import Foundation

import Foundation

@MainActor
@Observable
final class UserViewModel {

    var users: [User] = []
    var isLoading: Bool = false

    func loadUsers() async {
        isLoading = true

        do {
            let response = try await APIClient.shared.fetchUsers(page: 1)
            self.users = response
        } catch {
            print("Failed to load users")
        }

        isLoading = false
    }
}
