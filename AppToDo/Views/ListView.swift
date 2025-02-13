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
        ZStack {
            if listViewModel.item.isEmpty {
                VStack {
                    Text("There is nothing to do")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    Text("do sometihng you lazy...")
                    
                    NavigationLink(destination: AddView()) {
                        Text("Try adding something")
                            .frame(height: 60)
                            .frame(maxWidth:.infinity)
                            .foregroundColor(.white)
                            .background(Color.blue.opacity(0.7))
                            .cornerRadius(15)
                            .padding()
                    }
                    Spacer()
                }
            } else {
                List {
                ForEach(listViewModel.item) { item in
                    ListRowView(item: item)
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .navigationTitle("To do")
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
