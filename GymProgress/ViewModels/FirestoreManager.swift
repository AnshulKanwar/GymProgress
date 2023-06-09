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
    
    private static func getDocuments<T: Decodable>(collectionPath: String, completion: @escaping ([T]) -> Void) {
        // TODO: better concatenation
        db.collection(collectionPath).getDocuments { querySnapshot, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let mappedDocuments = querySnapshot!.documents.map { document in
                    return try! document.data(as: T.self)
                }
                completion(mappedDocuments)
            }
        }
    }
    
    static func getExercises(completion: @escaping ([Exercise]) -> Void) {
        // TODO: better concatenation
        getDocuments(collectionPath: "users/\(authManager.uid)/exercises", completion: completion)
    }
    
    static func getSessions(exerciseId: String, completion: @escaping ([Session]) -> Void) {
        getDocuments(collectionPath: "users/\(authManager.uid)/exercises/\(exerciseId)/sessions", completion: completion)
    }
}
