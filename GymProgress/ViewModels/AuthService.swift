//
//  AuthService.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 08/06/23.
//

import Foundation
import SwiftUI
import FirebaseAuth

class AuthService: ObservableObject {
    @AppStorage("uid") var uid: String = ""
    
    var isLoggedIn: Bool {
        !uid.isEmpty
    }
    
    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let user = authResult?.user {
                self.uid = user.uid
            } else if let error = error {
                print(error)
            }
        }
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let user = authResult?.user {
                self.uid = user.uid
            } else if let error = error {
                print(error)
            }
        }
    }
    
    func logout() {
        self.uid = ""
    }
}
