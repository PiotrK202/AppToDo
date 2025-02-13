//
//  ListViewModel.swift
//  AppToDo
//
//  Created by piotr koscielny on 13/02/2025.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var item: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "first title", isCompleted: false),
            ItemModel(title: "secound title", isCompleted: true),
            ItemModel(title: "third title", isCompleted: false)
            ]
        item.append(contentsOf: newItems)
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
    
}
