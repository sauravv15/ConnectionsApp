//
//  FeedView.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 8/11/23.
//

import SwiftUI

struct ServiceView: View {
    
    let colors: [Color] =
        [.red, .orange, .yellow, .green, .blue, .purple]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("MainColor")
                VStack {
                    ZStack {
                        VStack {
                            HStack {
                                NavigationLink {
                                    CreateServiceView()
                                } label: {
                                    Text("Restaurants")
                                        .bold()
                                        .foregroundColor(.white)
                                        .frame(width: 150, height:60)
                                        .background(
                                            LinearGradient(colors: [.accentColor, .accentColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        )
                                        .cornerRadius(20)
                                }
                            }
                            .offset(x:0, y:30)
                        }
                    }
                    .frame(maxHeight:170)
                    ZStack {
                        
                        //This will eventually iterate through our curated list
                        ScrollView {
                            ForEach(0..<colors.count) {
                                LazyVStack {
                                    HStack {
                                        Text("Service Title")
                                        Text("Service Rating")
                                    }
                                    .padding(10)
                                    Text("Location")
                                    Text("Description")
                                    
                                }.background(
                                    RoundedRectangle(cornerRadius:20)
                                        .fill(LinearGradient(colors: [Color(.init(srgbRed: (colors[$0].redComponent + 0.5 > 1 ? 1 : colors[$0].redComponent + 0.5), green: (colors[$0].greenComponent + 0.5 > 1 ? 1 : colors[$0].greenComponent + 0.5), blue: (colors[$0].blueComponent + 0.5 > 1 ? 1 : colors[$0].blueComponent + 0.5), alpha: 1)), Color(UIColor(colors[$0]))], startPoint: .topLeading, endPoint: .bottomTrailing))
                                        .frame(width: 380, height: 150)
                                )
                                .padding(40)
                                
                            }
                            
                        }
                    }
                    .padding([.bottom], 100)
                    //                TabView(selection: $page) {
                    //                    .tabItem {
                    //                        Label("Services", systemImage: "star")
                    //                    }
                    //                    .tag(Tab.services)
                    //                    .tabItem {
                    //                        Label("Parties", systemImage: "list.bullet")
                    //                    }
                    //                    .tag(Tab.parties)
                    //                }
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView()
    }
}
