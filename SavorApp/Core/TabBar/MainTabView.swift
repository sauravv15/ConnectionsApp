//
//  MainTabView.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 8/11/23.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    @StateObject var serviceDataManager = ServiceDataManager()
    
    var body: some View {
        TabView {
            ServiceView()
                .environmentObject(serviceDataManager)
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            CurrentUserProfileView(user: user)
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(.accentColor)
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(user: User.MOCK_USERS[0])
    }
}
