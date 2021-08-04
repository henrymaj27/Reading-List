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
                    HStack {
                        NavigationLink("Add Book", destination: FutureList())
                            .padding(.leading, 35)
                            .foregroundColor(CustomColor.myBlue)
                        Spacer()
                    }
                    Spacer()
                }
                ZStack {
                    Color.black
                        .ignoresSafeArea()
                        .opacity(0.5)
                    HStack {
                        ZStack {
                            CustomColor.myTan
                                .ignoresSafeArea()
                                .frame(width:150)
                            VStack {
                                Image(systemName: "multiply")
                                    .font(.system(size: 30, weight: .semibold))
                                    .foregroundColor(CustomColor.myBrown)
                                    .onTapGesture {
                                        menu = false
                                    }
                                Spacer()
                                Group {
                                    NavigationLink(
                                        destination: ZStack{
                                            Text("Hello")
                                        },
                                        label: {
                                            Text("Future Reads")
                                        }
                                    )
                                    NavigationLink("Previous Reads", destination: FutureList())
                                }
                                .foregroundColor(CustomColor.myBlue)
                                .padding(5)
                                .background(CustomColor.myBrown)
                                .cornerRadius(7)
                            }
                            .padding(.top, 120)
                            .padding(.bottom, 400)
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

struct BookItem: Identifiable, Codable {
    var id = UUID()
    var title = String()
    var author = String()
    var pages = String()
}
