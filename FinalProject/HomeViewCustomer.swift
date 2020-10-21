//
//  HomeViewCustomer.swift
//  FinalProject
//
//  Created by Angela Chen on 10/14/20.
//

import SwiftUI

struct HomeViewCustomer: View {
    @State private var showingCart = false
    @State private var showingBuyProduct = false
    @ObservedObject var products = Products()
    @State private var addedProducts = Products()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(products.items, id: \.id) { item in
//                    NavigationLink(destination: CartView(products: products)) {
//                        Text(item.name)
//                    }
                    Button(action: {
                        addedProducts.addProduct(productItem: item)
                    }) {
                        Text(item.name)
                    }
                }

            }
            .navigationBarTitle("Products on Sale!")
            .navigationBarItems(trailing:
                HStack (spacing: 250) {
                    
                    NavigationLink(destination: CartView(products: addedProducts)) {
                        Image(systemName: "cart")
                    }
                    
                }
                
            
            )
           
            
        }
        
    }
}

struct HomeViewCustomer_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCustomer()
    }
}
