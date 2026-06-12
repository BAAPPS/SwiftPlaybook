//
//  UserListView.swift
//  01-API-Networking
//
//  Created by D F on 6/12/26.
//

import SwiftUI


struct UserListView: View {

    @Environment(AuthViewModel.self) var auth
    @State private var vm = UserViewModel()

    var body: some View {
        NavigationView {
            List(vm.users) { user in
                Text(user.first_name)
            }
            .toolbar {
                Button("Logout") {
                    auth.logout()
                }
            }
            .task {
                await vm.loadUsers()
            }
        }
    }
}

#Preview {
    UserListView()
        .environment(AuthViewModel())
}
