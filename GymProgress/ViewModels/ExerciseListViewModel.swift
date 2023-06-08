//
//  ExerciseListViewModel.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 08/06/23.
//

import Foundation
import FirebaseFirestore

class ExerciseListViewModel: ObservableObject {
    let colRef = Firestore.firestore().collection("exercises")
    
    @Published var exercises: [Exercise] = []
    
    func getExercises() {
        self.colRef.getDocuments { querySnapshot, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.exercises = querySnapshot!.documents.map { document in
                    // TODO: Add Error Handling
                    return try! document.data(as: Exercise.self)
                }
            }
        }
    }
}
