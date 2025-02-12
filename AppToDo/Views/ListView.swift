//
//  ListView.swift
//  AppToDo
//
//  Created by piotr koscielny on 12/02/2025.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "1","2","3"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
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
