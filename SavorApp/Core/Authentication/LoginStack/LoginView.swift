//
//  LoginView.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 8/11/23.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var isSignInButtonDisabled: Bool {
        [viewModel.email, viewModel.password].contains(where: \.isEmpty)
        }
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color("MainColor")
                VStack(spacing: 20) {
                    Image("savor_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height:100)
                    TextField("Email", text: $viewModel.email, prompt: Text("Email").foregroundColor(.gray).bold())
                        .foregroundColor(.black)
                        .textFieldStyle(.plain)
                        .autocapitalization(.none)
                    Rectangle()
                        .frame(width: 350, height:1)
                        .foregroundColor(.black)
                    SecureField("Password", text: $viewModel.password, prompt: Text("Password").foregroundColor(.gray).bold())
                        .foregroundColor(.black)
                        .textFieldStyle(.plain)
                        .autocapitalization(.none)
                    Rectangle()
                        .frame(width: 350, height:1)
                        .foregroundColor(.black)
                    Button {
                        Task{ try await viewModel.signIn()}
                    } label: {
                        Text("Sign In")
                            .bold()
                            .foregroundColor(.white)
                            .frame(width: 200, height:40)
                            .background(
                                isSignInButtonDisabled ?
                                LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                                    LinearGradient(colors: [.accentColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .cornerRadius(20)
                            .disabled(isSignInButtonDisabled)
                            
                        
                    }
                    .padding(.top)
                    .offset(y: 100)
                    NavigationLink(destination: AddEmailView())
                        {
                        Text("Don't have an account? Sign Up")
                            .foregroundColor(Color.blue)
                    }
                    .offset(y: 110)


                }
                .frame(width:350)
            }
            .ignoresSafeArea()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
