//
//  AppToDoApp.swift
//  AppToDo
//
//  Created by piotr koscielny on 12/02/2025.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
            ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
