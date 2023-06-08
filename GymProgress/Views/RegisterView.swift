//
//  RegisterView.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 08/06/23.
//

import SwiftUI

struct RegisterView: View {
    @State private var email = ""
    @State private var password1 = ""
    @State private var password2 = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("Welcome to Gym Progress")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            VStack {
                TextField("Email", text: $email)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.foreground, lineWidth: 2)
                    )
                SecureField("Password", text: $password1)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.foreground, lineWidth: 2)
                    )
                SecureField("Confirm Password", text: $password2)
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
            
            Button(action: {}) {
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
