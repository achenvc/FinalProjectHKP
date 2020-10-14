//
//  AddProductView.swift
//  FinalProject
//
//  Created by Angela Chen on 10/14/20.
//

import SwiftUI

struct AddProductView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var products: Products
    
    @State private var name = ""
    @State private var description = ""
    @State private var amount = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ProductItem(name: self.name, description: self.description, amount: actualAmount)
                    self.products.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView(products: Products())
    }
}
