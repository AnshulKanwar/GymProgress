//
//  ExerciseListViewModel.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 08/06/23.
//

import Foundation
import FirebaseFirestore

class ExerciseListViewModel: ObservableObject {
    
    @Published var exercises: [Exercise] = []
    
    func getExercises() {
        FirestoreManager.getExercises { self.exercises = $0 }
    }
}
