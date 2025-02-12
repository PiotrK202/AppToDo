//
//  ItemModel.swift
//  AppToDo
//
//  Created by piotr koscielny on 12/02/2025.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}

