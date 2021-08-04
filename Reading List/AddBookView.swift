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
    var body: some View {
        NavigationView {
                    Form {
                        TextField("Title", text: $title)
                        TextField("Author", text: $author)
                        TextField("Pages", text: $pages)
                    }
                    .navigationBarTitle("Add New Book", displayMode: .inline)
                }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView(bookList: BookList())
    }
}
