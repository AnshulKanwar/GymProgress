//
//  LoginView.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 08/06/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome Back")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            VStack {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.foreground, lineWidth: 2)
                    )
                SecureField("Password", text: $password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.foreground, lineWidth: 2)
                    )
                
                NavigationLink(destination: RegisterView()){
                    Text("Don't have an account?")
                }
            }
            .padding(.bottom, 50)
            
            Button(action: {
                authManager.login(email: email, password: password)
            }) {
                Text("Login")
                    .padding(10)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Login")
        .navigationBarBackButtonHidden()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LoginView()
        }
    }
}
