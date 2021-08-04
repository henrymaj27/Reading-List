//
//  ContentView.swift
//  Reading List
//
//  Created by Henry Majewski on 8/2/21.
//

import SwiftUI
struct ContentView: View {
    @State private var menu = false
    var body: some View {
        NavigationView {
            ZStack {
                CustomColor.myGreen
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Image(systemName: "text.justify")
                            .font(Font.system(.title))
                            .padding()
                            .foregroundColor(CustomColor.myBlue)
                            .onTapGesture {
                                menu = true
                            }
                        Image("Bookworm Logo")
                            .resizable()
                            .frame(width: 270, height: 90)
                    }
                    Spacer()
                }
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                        .opacity(0.5)
                    HStack {
                        ZStack {
                            CustomColor.myPurple
                                .ignoresSafeArea()
                                .frame(width:180)
                            VStack {
                                Image(systemName: "multiply")
                                    .font(.system(size: 30, weight: .semibold))
                                    .foregroundColor(CustomColor.myBlue)
                                    .onTapGesture {
                                        menu = false
                                    }
                                Spacer()
                                Group {
                                    NavigationLink("Future Reads", destination: FutureList())
                                    NavigationLink("Previous Reads", destination: FutureList())
                                }
                                .foregroundColor(CustomColor.myBrown)
                                .padding(10)
                                .background(CustomColor.myBlue)
                                .cornerRadius(7)
                            }
                            .padding(.top, 25)
                            .padding(.bottom, 300)
                        }
                        Spacer()
                    }
                }
                .opacity(menu ? 1 : 0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomColor {
    static let myTan = Color("myTan")
    static let myGreen = Color("myGreen")
    static let myBrown = Color("myBrown")
    static let myBlue = Color("myBlue")
    static let myPurple = Color("myPurple")
}

