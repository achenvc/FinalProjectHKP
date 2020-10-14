//
//  ContentView.swift
//  FinalProject
//
//  Created by Angela Chen on 10/10/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isCorrect: Bool = false
    @State private var showAlert: Bool = false
    @State private var password: String = ""
    @State private var username: String = ""
    let correctUsername: String = "username"
    let correctPassword: String = "password"
    @State private var isAdmin: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome! Please enter your credentials.")
                    .font(.largeTitle)
                TextField("Username: ", text: $username).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Enter a password", text: $password)
                
//                NavigationLink(destination: HomeView()) {
//                                    Text("Log in")
//                                }.disabled(!self.check())

                NavigationLink(destination: HomeView(), isActive: $isAdmin) {
                    Text("")
                }
                Button(action: {
                    if(self.username == "admin") {
                        self.isAdmin = true
                        self.isCorrect = true
                    }
                    else if (self.username == self.correctUsername && self.password == self.correctPassword) {
                        self.isCorrect = true
                    }
                    else {
                        self.isCorrect = false
                        self.showAlert = true
                    }
                }) {
                    Text("Log in")
                }.disabled(self.username == "" || self.password == "")
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Incorrect Username or Password"), message: Text("Please try again"), dismissButton: .default(Text("Oops")){
                                self.showAlert.toggle()
                                })
                        }
                NavigationLink(destination: HomeViewCustomer(), isActive: $isCorrect) {
                        Text("")
                }
                   
            }
            
        }
    }
    

    

}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
