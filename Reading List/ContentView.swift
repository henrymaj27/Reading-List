//
//  ContentView.swift
//  Reading List
//
//  Created by Henry Majewski on 8/2/21.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var bookList = BookList()
    @State private var showingAddBookView = false
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
                        Button(action: {
                                showingAddBookView = true}) {
                            Image(systemName: "plus")
                            Text("Add Book").font(Font.custom("Baskerville", size: 24))
                        }
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
                                .frame(width:160)
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
                                        destination:
                                            NavigationView {
                                                ZStack{
                                                    List {
                                                        ForEach(bookList.items) { item in
                                                            if item.time == "Future" {
                                                                HStack {
                                                                    VStack(alignment: .leading) {
                                                                        Text(item.title)
                                                                            .font(Font.custom("Baskerville", size: 25))
                                                                            .foregroundColor(CustomColor.myPurple)
                                                                        Text(item.author)
                                                                            .font(Font.custom("Baskerville", size: 20))
                                                                            .foregroundColor(CustomColor.myGreen)
                                                                    }
                                                                    Spacer()
                                                                    Text("\(item.pages) pages")
                                                                        .font(Font.custom("Baskerville", size: 20))
                                                                        .foregroundColor(CustomColor.myGreen)
                                                                }
                                                            }
                                                        }
                                                        .onMove(perform: { indices, newOffset in
                                                            bookList.items.move(fromOffsets: indices, toOffset: newOffset)
                                                        })
                                                        .onDelete(perform: { indexSet in
                                                            bookList.items.remove(atOffsets: indexSet)
                                                        })
                                                    }
                                                    .navigationBarTitle("Future Reads", displayMode: .inline)
                                                    .navigationBarItems(trailing: EditButton())
                                                    .foregroundColor(CustomColor.myBrown)
                                                }
                                            },
                                        label: {
                                            Text("Future Reads").font(Font.custom("Baskerville", size: 22))
                                        }
                                    )
                                    NavigationLink(
                                        destination:
                                            NavigationView {
                                                ZStack{
                                                    List {
                                                        ForEach(bookList.items) { item in
                                                            if item.time == "Past" {
                                                                HStack {
                                                                    VStack(alignment: .leading) {
                                                                        Text(item.title)
                                                                            .font(Font.custom("Baskerville", size: 25))
                                                                            .foregroundColor(CustomColor.myPurple)
                                                                        Text(item.author)
                                                                            .font(Font.custom("Baskerville", size: 20))
                                                                            .foregroundColor(CustomColor.myGreen)
                                                                    }
                                                                    Spacer()
                                                                    Text("\(item.pages) pages")
                                                                        .font(Font.custom("Baskerville", size: 20))
                                                                        .foregroundColor(CustomColor.myGreen)
                                                                }
                                                            }
                                                        }
                                                        .onMove(perform: { indices, newOffset in
                                                            bookList.items.move(fromOffsets: indices, toOffset: newOffset)
                                                        })
                                                        .onDelete(perform: { indexSet in
                                                            bookList.items.remove(atOffsets: indexSet)
                                                        })
                                                    }
                                                    .navigationBarTitle("Past Reads", displayMode: .inline)
                                                    .navigationBarItems(trailing: EditButton())
                                                    .foregroundColor(CustomColor.myBrown)
                                                }
                                            },
                                        label: {
                                            Text("Past Reads").font(Font.custom("Baskerville", size: 22))
                                        }
                                    )
                                }
                                .foregroundColor(CustomColor.myBlue)
                                .padding(5)
                                .background(CustomColor.myBrown)
                                .cornerRadius(7)
                            }
                            .padding(.top, 50)
                            .padding(.bottom, 480)
                        }
                        Spacer()
                    }
                }
                .opacity(menu ? 1 : 0)
                .sheet(isPresented: $showingAddBookView, content: {
                    AddBookView(bookList: bookList)
                })
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
    var time = String()
}
