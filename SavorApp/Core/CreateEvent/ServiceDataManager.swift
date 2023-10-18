//
//  ServiceDataManager.swift
//  Savor
//
//  Created by Saurav Vidyadhara on 10/18/23.
//

import Foundation
import Firebase

class ServiceDataManager: ObservableObject {
    @Published var services: [Service] = []
    
    init() {
        fetchAllServices()
    }
    
    func fetchAllServices() {
        services.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Services")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let location = data["location"] as? String ?? ""
                    let rate = data["rate"] as? Double ?? 0.0
                    let desc = data["desc"] as? String ?? ""
                    
                    let service = Service(id: id, name: name, location: location, rate: rate, desc: desc)
                    self.services.append(service)
                }
            }
            
        }
    }
    
    func addService(service: Service) {
        let db = Firestore.firestore()
        let ref = db.collection("Services").document(service.name)
        ref.setData(["name": service.name, "location": service.location, "rate" : service.rate, "desc" : service.desc]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
