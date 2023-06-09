//
//  NewSessionViewModel.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 09/06/23.
//

import Foundation

class NewSessionViewModel: ObservableObject {
    @Published var date: Date = Date.now
    @Published var weight: String = ""
    @Published var reps: [String] = []
    
    func addRep() {
        reps.append("0")
    }
    
    func addSession(exerciseId: String) {
        let session = Session(date: self.date, weight: Int(self.weight)!, reps: reps.map { Int($0)! })
        FirestoreManager.addSession(exerciseId: exerciseId, session: session)
    }
}
