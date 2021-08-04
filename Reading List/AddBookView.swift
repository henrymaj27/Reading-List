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
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
                    Form {
                        TextField("Title", text: $title)
                        TextField("Author", text: $author)
                        TextField("Pages", text: $pages)
                    }
                    .navigationBarTitle("Add New To-Do Item", displayMode: .inline)
                    .navigationBarItems(trailing: Button("Save") {
                                    if title.count > 0 && author.count > 0 {
                                        let item = BookItem(id: UUID(), title: title,
                                                            author: author, pages: pages)
                                        bookList.items.append(item)
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                })
                }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView(bookList: BookList())
    }
}
