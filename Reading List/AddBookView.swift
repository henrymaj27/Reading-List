//
//  AddBookView.swift
//  Reading List
//
//  Created by Henry Majewski on 8/4/21.
//

import SwiftUI

struct AddBookView: View {
    @ObservedObject var bookList: BookList
    @State private var title = ""
    @State private var author = ""
    @State private var pages = ""
    @State private var time = ""
    @Environment(\.presentationMode) var presentationMode
    static let times = ["Past", "Future"]
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                    .font(Font.custom("Baskerville", size: 25))
                    .foregroundColor(CustomColor.myPurple)
                TextField("Author", text: $author)
                    .font(Font.custom("Baskerville", size: 20))
                    .foregroundColor(CustomColor.myGreen)
                TextField("Pages", text: $pages)
                    .foregroundColor(CustomColor.myGreen)
                    .font(Font.custom("Baskerville", size: 20))
                Picker("When are you reading?", selection: $time) {
                    ForEach(Self.times, id: \.self) { time in
                        Text(time)
                    }
                    .foregroundColor(CustomColor.myGreen)
                }
                .navigationBarTitle("Add New Book", displayMode: .inline).font(Font.custom("Baskerville", size: 20))
                .foregroundColor(CustomColor.myGreen)
                .navigationBarItems(trailing: Button("Save") {
                    if title.count > 0 && time.count > 0 {
                        let item = BookItem(id: UUID(), title: title, author: author, pages: pages, time: time)
                        bookList.items.append(item)
                        presentationMode.wrappedValue.dismiss()
                    }
                }) .foregroundColor(CustomColor.myBrown)
            }
        }
    }
}
struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView(bookList: BookList())
    }
}
