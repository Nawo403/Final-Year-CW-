//
//  ContentView.swift
//  CW Final Year
//
//  Created by Thilini Gunawardhana on 2024-03-26.
//

import SwiftUI

struct ContentView: View {
    enum ViewState {
        case login, signup
    }

    @State private var username: String = ""
    @State private var password: String = ""
    @State private var Email: String = ""
    @State private var confirmPassword: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var viewState: ViewState = .login

    var body: some View {
        VStack {
            if viewState == .login {
                if isLoggedIn {
                    Text("Welcome, \(username)")
                        .font(.title)
                        .padding()
                    Button(action: {
                        self.isLoggedIn = false
                        self.username = ""
                        self.password = ""
                    }) {
                        Text("Logout")
                    }
                } else {
                    TextField("Username", text: $username)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        // Add your login logic here
                        // For simplicity, let's just check if username and password are not empty
                        if !self.username.isEmpty && !self.password.isEmpty {
                            self.isLoggedIn = true
                        }
                    }) {
                        Text("Login")
                    }
                    .padding()
                    .disabled(username.isEmpty || password.isEmpty)

                    Button(action: {
                        self.viewState = .signup
                    }) {
                        Text("Create an Account")
                    }
                }
            } else if viewState == .signup {
                TextField("Username", text: $username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    // Add your signup logic here
                    // For simplicity, let's just check if username, password, and confirmPassword are not empty
                    if !self.username.isEmpty && !self.password.isEmpty && !self.confirmPassword.isEmpty && self.password == self.confirmPassword {
                        self.isLoggedIn = true
                        self.viewState = .login
                    }
                }) {
                    Text("Create Account")
                }
                .padding()
                .disabled(username.isEmpty || Email.isEmpty || password.isEmpty || confirmPassword.isEmpty || password != confirmPassword)

                Button(action: {
                    self.viewState = .login
                }) {
                    Text("Back to Login")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

