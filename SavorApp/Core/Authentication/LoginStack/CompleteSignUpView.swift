//
//  CompleteSignUpView.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 8/11/23.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing:20) {
                Text("Welcome To Savör, \(viewModel.fullname)!")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top)
                Button {
                    Task { try await viewModel.createUser()}
                } label: {
                    Text("Continue")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height:40)
                        .background(
                            LinearGradient(colors: [.teal, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .cornerRadius(20)
                        .padding(.vertical)
                }

                
            }
            .frame(width:350)
        }
        .ignoresSafeArea()
    }
}

struct CompleteSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignUpView()
    }
}

