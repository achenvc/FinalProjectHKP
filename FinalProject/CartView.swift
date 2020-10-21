//
//  CartView.swift
//  FinalProject
//
//  Created by Angela Chen on 10/16/20.
//

import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var products = Products()
    
    @State private var showCheckOutScreen = false
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    ForEach(products.items, id: \.id) { item in
                        Text("Item Info: \(item.name), $\(item.amount)")
                    }
                    .onDelete(perform: removeItems)
            }
                Button(action: {
                    self.showCheckOutScreen = true
                }) {
                    Text("Proceed to checkout")
                }
                
            }
            .navigationBarTitle("My Cart")
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        products.items.remove(atOffsets: offsets)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
