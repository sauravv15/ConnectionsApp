//
//  CurrentUserProfileView.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 8/11/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    var body: some View {
        ZStack{
            Color.black
            Button {
                AuthService.shared.signOut()
            } label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
            }
        }
        .ignoresSafeArea()

    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView()
    }
}
