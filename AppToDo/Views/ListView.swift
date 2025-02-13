//
//  ListView.swift
//  AppToDo
//
//  Created by piotr koscielny on 12/02/2025.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
    ItemModel(title: "1", isCompleted: false),
    ItemModel(title: "2", isCompleted: true),
    ItemModel(title: "3", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
              ListRowView(item: item)
            }
            .onDelete(perform: deletItem)
                    .onMove(perform: moveItem)
            }
        }
        .navigationTitle("To Do List")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("add", destination: AddView())
        )
    }
        
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        ListView()
        }
    }
}
