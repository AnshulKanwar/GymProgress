//
//  AddSessionView.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 09/06/23.
//

import SwiftUI

struct NewSessionView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var newSessionViewModel = NewSessionViewModel()
    
    let exerciseId: String
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    DatePicker("Date", selection: $newSessionViewModel.date, displayedComponents: [.date])
                    TextField("Weight (kg)", text: $newSessionViewModel.weight)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    ForEach($newSessionViewModel.reps, id: \.self) { rep in
                        TextField("Reps", text: rep)
                            .keyboardType(.decimalPad)
                    }
                    Button(action: { newSessionViewModel.addRep() }) {
                        Label("Add Rep", systemImage: "plus.circle.fill")
                    }
                } header: {
                    Text("Reps")
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        newSessionViewModel.addSession(exerciseId: exerciseId)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct NewSessionView_Previews: PreviewProvider {
    static var previews: some View {
        NewSessionView(exerciseId: Exercise.sampleExercise.id!)
    }
}
