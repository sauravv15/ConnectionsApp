//
//  CreateServiceView.swift
//  UniSync
//
//  Created by Saurav Vidyadhara on 8/11/23.
//

import SwiftUI
import Firebase

struct CreateServiceView: View {
    
    @State var serviceName: String = ""
    @State var serviceLocation: String = ""
    @State var servicePrice: String = ""
    @State var serviceDesc: String = ""
    var isCreateButtonDisabled: Bool {
            [serviceName, serviceLocation, servicePrice, serviceDesc].contains(where: \.isEmpty)
        }
    @State private var bgColor =
            Color(.sRGB, red: 0.98, green: 0.9, blue: 0.2)
    
    

    var body: some View {
        ZStack {
            Color("MainColor")
            VStack {
                ZStack {
                    Text("CREATE YOUR SERVICE")
                        .bold()
                        .foregroundColor(.white)
                        .font(.system(size: 36))
                        .frame(width:400)
                        .frame(maxHeight: 120)
                        .offset(x:0, y:-580)
                    ScrollView {
                        VStack {
                            Text("What is your service called?")
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .offset(x:-60)
                            TextField("", text: $serviceName)
                                .foregroundColor(.white)
                                .frame(width: 350)
                            Rectangle()
                                .frame(width: 350, height:1)
                                .foregroundColor(.white)
                        }
                        .padding()
                        VStack {
                            Text("Where will your service be?")
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .offset(x:-60)
                            TextField("", text: $serviceLocation)
                                .foregroundColor(.white)
                                .frame(width: 350)
                            Rectangle()
                                .frame(width: 350, height:1)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom)
                        VStack {
                            Text("How much will you charge per hour?\n(Hourly rate; leave blank if free service)")
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .offset(x:-5)
                            TextField("", text: $servicePrice)
                                .foregroundColor(.white)
                                .frame(width: 340)
                            Rectangle()
                                .frame(width: 340, height:1)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom)
                        VStack {
                            Text("Describe your service to a user")
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .offset(x:-40)
                            TextField("", text: $serviceDesc)
                                .foregroundColor(.white)
                                .frame(width: 340)
                            Rectangle()
                                .frame(width: 340, height:1)
                                .foregroundColor(.white)
                        }
                        .padding(.bottom)
                        VStack {
                            Text("Design your service card")
                                .foregroundColor(.black)
                                .fontWeight(.heavy)
                                .offset(x:-65)
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
                                    Text(servicePrice + "")
                                }
                                .padding(10)
                                Text(serviceDesc)
                                
                            }.background(
                                RoundedRectangle(cornerRadius:20)
                                    .fill(LinearGradient(colors: [Color(.init(srgbRed: (bgColor.redComponent + 0.5 > 1 ? 1 : bgColor.redComponent + 0.5), green: (bgColor.greenComponent + 0.5 > 1 ? 1 : bgColor.greenComponent + 0.5), blue: (bgColor.blueComponent + 0.5 > 1 ? 1 : bgColor.blueComponent + 0.5), alpha: 1)), Color(UIColor(bgColor))], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(width: 380, height: 150)
                            )
                            .padding(40)
                            HStack {
                                Text("Pick a color:")
                                    .foregroundColor(.black)
                                    .fontWeight(.heavy)
                                    .offset(x:40)
                                ColorPicker("", selection: $bgColor)
                                    .offset(x:-220)
                            }
                        }
                        .padding(.bottom)
                        HStack {
                            Button {
                                //create service
                            } label: {
                                Text("Create My Service")
                                    .bold()
                                    .foregroundColor(.white)
                                    .frame(width: 200, height:40)
                                    .background(
                                        isCreateButtonDisabled ?
                                        LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                                            LinearGradient(colors: [.teal, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    )
                                    .cornerRadius(20)
                                    .disabled(isCreateButtonDisabled)
                            }
                        }
                    }
                    .offset(x:0, y:-120)
                    .frame(minHeight: 0, maxHeight: .infinity)
                    .padding([.bottom], 270)
                }
            }
            .offset(x:0, y:280)
        }
        .ignoresSafeArea()
    }
    
}

extension Color {
    var redComponent: Double {
#if canImport(UIKit)
        typealias NativeColor = UIColor
#elseif canImport(AppKit)
        typealias NativeColor = NSColor
#endif
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        let uiColor = NativeColor(self)
        uiColor.getRed(&r, green: &g, blue: &b, alpha: nil)
        
        return Double(r)
    }
    var greenComponent: Double {
#if canImport(UIKit)
        typealias NativeColor = UIColor
#elseif canImport(AppKit)
        typealias NativeColor = NSColor
#endif
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        let uiColor = NativeColor(self)
        uiColor.getRed(&r, green: &g, blue: &b, alpha: nil)
        
        return Double(g)
    }
    var blueComponent: Double {
#if canImport(UIKit)
        typealias NativeColor = UIColor
#elseif canImport(AppKit)
        typealias NativeColor = NSColor
#endif
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        let uiColor = NativeColor(self)
        uiColor.getRed(&r, green: &g, blue: &b, alpha: nil)
        
        return Double(b)
    }
}

struct CreateServiceView_Previews: PreviewProvider {
    static var previews: some View {
        CreateServiceView()
    }
}
