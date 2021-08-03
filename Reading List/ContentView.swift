//
//  ContentView.swift
//  Reading List
//
//  Created by Henry Majewski on 8/2/21.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
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
