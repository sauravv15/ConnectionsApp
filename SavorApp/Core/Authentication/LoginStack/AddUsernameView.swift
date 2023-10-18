//
//  AddUsernameView.swift
//  Savor
//
//  Created by Saurav Vidyadhara on 10/18/23.
//

import SwiftUI

struct AddUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var isSignInButtonDisabled: Bool {
        [viewModel.email].contains(where: \.isEmpty)
        }
    
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing:20) {
                Text("Create A Username.")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top)
                TextField("Username", text: $viewModel.username, prompt: Text("Username").foregroundColor(.gray).bold())
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .autocapitalization(.none)
                Rectangle()
                    .frame(width:.infinity, height:1)
                    .foregroundColor(.white)
                NavigationLink {
                    AddPasswordView()
                } label: {
                    Text("Continue")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height:40)
                        .background(
                            isSignInButtonDisabled ?
                                    LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                                        LinearGradient(colors: [.accentColor, .accentColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .cornerRadius(20)
                        .disabled(isSignInButtonDisabled)
                        .padding(.vertical)
                }

                
            }
            .frame(width:350)
        }
        .ignoresSafeArea()
    }
}

struct AddUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        AddUsernameView()
    }
}
