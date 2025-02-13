//
//  ListView.swift
//  AppToDo
//
//  Created by piotr koscielny on 12/02/2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.item) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
            }
        .navigationTitle("To do app")
        .navigationBarItems(leading: EditButton(),
                            trailing: NavigationLink("add", destination: AddView()))
        }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        ListView()
        }
        .environmentObject(ListViewModel())
    }
}
