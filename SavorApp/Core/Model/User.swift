//
//  User.swift
//  Savor
//
//  Created by Saurav Vidyadhara on 10/18/23.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    let email: String
    var username: String
    var profileImageURL: String?
    var fullname: String
    var bio: String?
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, email: "rj@gmail.com", username: "RJ", fullname: "Rohit Jayas")
    ]
}
