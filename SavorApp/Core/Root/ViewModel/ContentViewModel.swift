//
//  ContentViewModel.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 8/11/23.
//

import Foundation
import Firebase
import Combine

@MainActor
class ContentViewModel: ObservableObject {
    
    private let service = AuthService.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userSession: FirebaseAuth.User? //Looks for changes
    @Published var currentUser: User?
    
    init(){
        setUpSubscribers()
    }
    
    func setUpSubscribers(){
        service.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        service.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
    
}
