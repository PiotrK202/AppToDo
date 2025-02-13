//
//  ListViewModel.swift
//  AppToDo
//
//  Created by piotr koscielny on 13/02/2025.
//

import Foundation
import SwiftUI

class ListViewModel: ObservableObject {
    @Published var item: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    let itemKey = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
       
        self.item = savedItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        item.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        item.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        item.append(newItem)
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(item) {
            UserDefaults.standard.set(encodedData, forKey: "items_list")
        }
    }
    
}
