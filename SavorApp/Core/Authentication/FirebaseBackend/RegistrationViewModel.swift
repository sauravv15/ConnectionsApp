//
//  RegistrationViewModel.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 8/11/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var fullname = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username, fullname: fullname)
    }
}
