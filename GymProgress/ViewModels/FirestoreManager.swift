//
//  FirestoreManager.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 08/06/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class FirestoreManager {
    static let db = Firestore.firestore()
    
    static var authManager = AuthManager.shared
    
    static func createUser(uid: String) {
        db.collection("users").document(uid).setData([:])
    }
    
    static func getExercises(completion: @escaping ([Exercise]) -> Void) {
        // TODO: better concatenation
        db.collection("users/\(authManager.uid)/exercises").getDocuments { querySnapshot, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                var exercises = querySnapshot!.documents.map { document in
                    try! document.data(as: Exercise.self)
                }
                completion(exercises)
            }
        }
    }
}
