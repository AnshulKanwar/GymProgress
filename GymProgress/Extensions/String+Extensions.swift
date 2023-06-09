//
//  String+Extensions.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 09/06/23.
//

import Foundation

// copied from https://stackoverflow.com/a/43212039
extension String {
    func camelCaseToWords() -> String {
        //        return unicodeScalars.dropFirst().reduce(String(prefix(1))) {
        //            return CharacterSet.uppercaseLetters.contains($1)
        //                ? $0 + " " + String($1)
        //                : $0 + String($1)
        //        }
        //        .capitalize()
        
        let uScalars = unicodeScalars
        let spaceSeparated = uScalars.reduce("") {
            return CharacterSet.uppercaseLetters.contains($1)
            ? $0 + " " + String($1)
            : $0 + String($1)
        }
        
        return spaceSeparated.capitalized
    }
}
