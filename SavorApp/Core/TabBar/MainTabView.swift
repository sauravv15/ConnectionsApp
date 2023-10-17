//
//  MainTabView.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 8/11/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ServiceView()
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(.accentColor)
        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
