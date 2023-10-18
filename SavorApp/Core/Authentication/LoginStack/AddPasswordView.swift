//
//  AddPasswordView.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 8/11/23.
//

import SwiftUI

struct AddPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var isSignInButtonDisabled: Bool {
        [viewModel.password].contains(where: \.isEmpty)
        }
    
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing:20) {
                Text("Create A Password")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top)
                SecureField("Password", text: $viewModel.password, prompt: Text("Password").foregroundColor(.gray).bold())
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .autocapitalization(.none)
                Rectangle()
                    .frame(width:.infinity, height:1)
                    .foregroundColor(.white)
                NavigationLink {
                    CompleteSignUpView()
                } label: {
                    Text("Continue")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height:40)
                        .background(
                            isSignInButtonDisabled ?
                            LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                                LinearGradient(colors: [.teal, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
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

struct AddPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        AddPasswordView()
    }
}
