//
//  AddProductView.swift
//  FinalProject
//
//  Created by Angela Chen on 10/14/20.
//

import SwiftUI

struct AddProductView: View {
    
    @State private var image: Image?
   // let ImagePickerObj = ImagePicker()
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var products: Products
    @State private var name = ""
    @State private var description = ""
    @State private var amount = ""
    @State private var showingImagePicker = false
    
    @State private var inputImage: UIImage?
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Name", text: $name)
                    TextField("Description", text: $description)
                    TextField("Amount", text: $amount)
                        .keyboardType(.numberPad)
                    Button(action: {
                        self.showingImagePicker = true
                    }) {
                        Text("Please choose a picture")
                    }
                }
                if(image != nil) {
                    image?
                        .resizable()
                        .scaledToFit()
                }
                
            }
            
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
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
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}


struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView(products: Products())
    }
}
