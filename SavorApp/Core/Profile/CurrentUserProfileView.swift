//
//  CurrentUserProfileView.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 8/11/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    @State var defaultService = "Choose a Service";
    @State var serviceName: String = ""
    @State var serviceLocation: String = ""
    @State var servicePrice: String = ""
    @State var serviceDesc: String = ""
    
    var body: some View {
        ZStack{
            Color.black
            VStack {
                Button {
                    AuthService.shared.signOut()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                }
                .offset(x:170, y:-200);
                Circle()
                    .fill(.blue)
                    .frame(width:120, height:120)
                    .offset(x:0, y:-200)
                HStack{
                    Text("Email Address:")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Text(user.email)
                        .foregroundColor(.white)
                }
                    .offset(x:-40, y:-150)
                    .padding(.bottom)
                HStack{
                    Text("Contact:")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Text("123-456-7890")
                        .foregroundColor(.white)
                }.offset(x:-70, y:-150)
                Text("My Services").font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .offset(x:0, y:-120)
                Menu{
                    Button(action: {
                        self.serviceName = "Service 1"
                        self.defaultService = "Service 1"
                    }, label: {
                        Text("Service 1")
                            .foregroundColor(.white)
                    })
                    Button(action: {
                        self.serviceName = "Service 2"
                        self.defaultService = "Service 2"
                    }, label: {
                        Text("Service 2")
                            .foregroundColor(.white)
                    })
                    Button(action: {
                        self.serviceName = "Service 3"
                        self.defaultService = "Service 3"
                    }, label: {
                        Text("Service 3")
                            .foregroundColor(.white)
                    })
                } label : {
                    Text(defaultService)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius:20)
                                .fill(.blue)
                                .frame(width: 150, height: 50)
                        )
                }
                .offset(x:0, y:-100)
                LazyVStack {
                    HStack {
                        Text(serviceName)
                        ForEach(1..<6) { num in
                            Image(systemName: "star.fill")
                        }
                    }
                    .padding(10)
                    HStack{
                        Text(serviceLocation)
                        Text(servicePrice + "/hr")
                    }
                    .padding(10)
                    Text(serviceDesc)
                    
                }.background(
                    RoundedRectangle(cornerRadius:20)
                        .fill(.red)
                        .frame(width: 380, height: 150)
                )
                .offset(x:0, y:-50)
                HStack{
                    Text("Interactions:")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Text("test@gmail.com")
                }
                    .offset(x:-40, y:-10)
                    .padding(.bottom)
                HStack{
                    Text("Total Revenue: $")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Text("test@gmail.com")
                }
                    .offset(x:-33, y:-10)
                
            }
            .offset(x:0, y:100)
        }
        .ignoresSafeArea()

    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
