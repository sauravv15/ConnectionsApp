//
//  ContentView.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 7/31/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    var body: some View {
        Group {
            if viewModel.userSession == nil{
                LoginView()
                    .environmentObject(registrationViewModel)
            }
            else{
                MainTabView()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
