//
//  Session.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 09/06/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Session: Codable, Identifiable {
    @DocumentID var id: String?
    var date: Date
    var weight: Int
    var reps: [Int]
    
    var volume: Int {
        weight * reps.reduce(1) {
            $0 * $1
        }
    }
}
