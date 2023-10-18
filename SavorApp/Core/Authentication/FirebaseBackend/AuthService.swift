//
//  AuthService.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 8/11/23.
//

import Foundation
import FirebaseAuth
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User? // Keeps user logged in (presentation logic)
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    init() {
        
        
        Task {try await loadUserData()}
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to login user")
        }
    }
    @MainActor
    func createUser(email: String, password: String, username: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG: User Made")
            self.userSession = result.user
            await uploadUserData(uid: result.user.uid, username: username, email: email, fullname: fullname)
            print("DEBUG: Data Uploaded")
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to register user")
        }
    }
    
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser // Checks for user logged in
        guard let currentUid = userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("Users").document(currentUid).getDocument()
        let data = snapshot.data()
        let email = data?["email"] as? String ?? ""
        let id = data?["id"] as? String ?? ""
        let username = data?["username"] as? String ?? ""
        let fullname = data?["fullname"] as? String ?? ""
        self.currentUser = User(id: id, email: email, username: username, fullname: fullname)
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String, fullname: String) async {
        let firestore = Firestore.firestore()
        let usersCollection = firestore.collection("Users")
        let documentRef = usersCollection.document(uid)

        documentRef.setData([
            "email": email,
            "fullname": fullname,
            "id": uid,
            "username": username,
        ]) { error in
            if let error = error {
                print(error)
            } else {
                print("User data uploaded successfully")
            }
        }
        
    }
}
