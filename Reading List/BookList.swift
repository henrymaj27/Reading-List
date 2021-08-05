//
//  BookList.swift
//  Reading List
//
//  Created by Henry Majewski on 8/4/21.
//

import Foundation

class BookList: ObservableObject {
    @Published var items : [BookItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([BookItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}
