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
    private let itemKey = "items_list"


    func getItems() {
        do {
            guard let data = UserDefaults.standard.data(forKey: itemKey) else { return }
            let savedItems = try JSONDecoder().decode([ItemModel].self, from: data)
            item = savedItems
        } catch {
            print("error")
        }
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
