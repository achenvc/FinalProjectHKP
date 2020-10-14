//
//  HomeView.swift
//  FinalProject
//
//  Created by Angela Chen on 10/10/20.
//

import SwiftUI

struct ProductItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let description: String
    let amount: Int
    
}

class Products: ObservableObject {
    @Published var items: [ProductItem] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ProductItem].self, from: items) {
                self.items = decoded
                return
            }
        }

        self.items = []
    }
}

struct HomeView: View {
    @State private var showingAddProduct = false
    @ObservedObject var products = Products()
    //this is homeview for managers
    var body: some View {
        
        NavigationView {
            List {
                ForEach(products.items, id: \.id) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)

            }
            .navigationBarTitle("Edit Your Products")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddProduct = true
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $showingAddProduct) {
                AddProductView(products: self.products)
            }
        }
        
    }
    func removeItems(at offsets: IndexSet) {
        products.items.remove(atOffsets: offsets)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
