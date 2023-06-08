//
//  RegisterView.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 08/06/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to Gym Progress")
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
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.foreground, lineWidth: 2)
                    )
                
                NavigationLink(destination: LoginView()){
                    Text("Already have an account?")
                }
            }
            .padding(.bottom, 50)
            
            Button(action: {
                if (password == confirmPassword) {
                    authService.register(email: email, password: password)
                }
            }) {
                Text("Register")
                    .padding(10)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Register")
        .navigationBarBackButtonHidden()
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RegisterView()
        }
    }
}
