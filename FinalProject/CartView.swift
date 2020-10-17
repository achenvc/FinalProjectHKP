//
//  CartView.swift
//  FinalProject
//
//  Created by Angela Chen on 10/16/20.
//

import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var products: Products
    
    @State private var name = ""
    @State private var description = ""
    @State private var amount = ""
    
    var body: some View {
        NavigationView {
            Form {
                Text("Name: + \(name)")
                Text("Description + \(description)")
                Text("Amount + \(amount)")
            }
            .navigationBarTitle("Add to Cart")
            .navigationBarItems(trailing: Button("Add to Card") {
                if let actualAmount = Int(self.amount) {
                    let item = ProductItem(name: self.name, description: self.description, amount: actualAmount)
                    self.products.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(products: Products())
    }
}
