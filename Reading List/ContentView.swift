//
//  ContentView.swift
//  Reading List
//
//  Created by Henry Majewski on 8/2/21.
//

import SwiftUI
struct ContentView: View {
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
                        Image("Bookworm Logo")
                            .resizable()
                            .frame(width: 270, height: 90)
                    }
                    
                }
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                        .opacity(0.5)
                    HStack {
                        ZStack {
                            CustomColor.myPurple
                                .ignoresSafeArea()
                                .frame(width:240)
                            VStack {
                                HStack {
                                    Image(systemName: "multiply")
                                        .font(.system(size: 30, weight: .semibold))
                                        .foregroundColor(CustomColor.myBlue)
                                }
                                HStack {
                                    NavigationLink("Future Reads", destination: FutureList())
                                        .foregroundColor(CustomColor.myBrown)
                                        .padding(10)
                                        .background(CustomColor.myBlue)
                                        .cornerRadius(7)
                                }
                                NavigationLink("Previous Reads", destination: FutureList())
                                    .foregroundColor(CustomColor.myBrown)
                                    .padding(10)
                                    .background(CustomColor.myBlue)
                                    .cornerRadius(7)
                            }
                        }
                        Spacer()
                    }
                }
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

