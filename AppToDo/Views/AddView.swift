//
//  AddView.swift
//  AppToDo
//
//  Created by piotr koscielny on 12/02/2025.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText = ""
    
    var body: some View {
        ScrollView {
            TextField("type what to add", text: $textFieldText)
                .padding()
                .frame(height:60)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()
            
            Button(action: saveButtonPressed, label: {
                Text("Save")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 150 ,height: 55, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(20)
            })

            
        }
        .navigationTitle("add an item")
    }
    
    func saveButtonPressed() {
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        AddView()
        }
        .environmentObject(ListViewModel())
    }
}
