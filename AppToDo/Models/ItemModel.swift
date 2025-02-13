//
//  ItemModel.swift
//  AppToDo
//
//  Created by piotr koscielny on 12/02/2025.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isComplited: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isComplited
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isComplited: !isCompleted)
    }
    
}

