//
//  Exercise.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 08/06/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Exercise: Codable, Identifiable {
    @DocumentID var id: String?
    
    var name: String {
        id!.camelCaseToWords()
    }
}

extension Exercise {
    static let sampleExercise = Exercise(id: "Bench Press")
}
