//
//  ListViewModel.swift
//  AppToDo
//
//  Created by piotr koscielny on 13/02/2025.
//

import Foundation

class ListViewModel {
    @Published var items: [ItemModel] = []
    
    init() {
        
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "1", isCompleted: false),
            ItemModel(title: "2", isCompleted: true),
            ItemModel(title: "3", isCompleted: false)
            ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}
