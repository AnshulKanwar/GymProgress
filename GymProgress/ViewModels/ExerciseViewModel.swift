//
//  ExerciseViewModel.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 09/06/23.
//

import Foundation

class ExerciseViewModel: ObservableObject {
    @Published var sessions: [Session] = []
    
    func getSessions(exerciseId: String) {
        FirestoreManager.getSessions(exerciseId: exerciseId) { self.sessions = $0 }
    }
}
