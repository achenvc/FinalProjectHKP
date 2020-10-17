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
    //this is homeview for managers
    var body: some View {
        
        NavigationView {
            List {
                ForEach(products.items, id: \.id) { item in
                    //Text(item.name)
                    NavigationLink(destination: HomeView(), isActive: $showingBuyProduct) {
                        Text("")
                    }
                    Button(action: {
                        self.showingBuyProduct = true
                    }) {
                        Text(item.name)
                    }
                }

            }
            .navigationBarTitle("Products on Sale!")
            .navigationBarItems(trailing:
                HStack (spacing: 250) {
                    Button(action: {
                        self.showingBuyProduct = true
                    }) {
                        Image(systemName: "plus")
                    }
                    
                    Button(action: {
                       self.showingCart = true
                    }) {
                        Image(systemName: "cart")
                    }
                }
                
            
            )
            .sheet(isPresented: $showingCart) {
                //AddProductView(products: self.products)
            }
            .sheet(isPresented: $showingBuyProduct) {
                 
            }
            
        }
        
    }
}

struct HomeViewCustomer_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewCustomer()
    }
}
