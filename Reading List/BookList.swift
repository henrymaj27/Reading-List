//
//  BookList.swift
//  Reading List
//
//  Created by Henry Majewski on 8/4/21.
//

import Foundation

class BookList: ObservableObject {
    @Published var items = [bookItem(title: "Book 1", author: "Author 1", pages: "25"),
                            bookItem(title: "Book 2", author: "Author 2", pages: "26"),
                            bookItem(title: "Book 3", author: "Author 3", pages: "27")]
 }
