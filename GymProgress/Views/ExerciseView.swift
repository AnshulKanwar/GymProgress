//
//  ExerciseView.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 09/06/23.
//

import SwiftUI

struct ExerciseView: View {
    @ObservedObject var exerciseViewModel = ExerciseViewModel()
    let exercise: Exercise
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Grid {
                    GridRow {
                        Text("Weight (kg)")
                        Text("Reps")
                    }
                    .bold()
                    
                    Divider()
                    
                    ForEach(exerciseViewModel.sessions.dropLast()) { session in
                        GridRow {
                            Text("\(session.weight)")
                            Text(session.reps.map { String($0) }.joined(separator: "x"))
                        }
                        Divider()
                    }
                    
                    if let lastSession = exerciseViewModel.sessions.last {
                        GridRow {
                            Text("\(lastSession.weight)")
                            Text(lastSession.reps.map { String($0) }.joined(separator: "x"))
                        }
                    }
                }
                
            }
            .onAppear {
                exerciseViewModel.getSessions(exerciseId: exercise.id!)
            }
            
            Spacer()
            
            Button(action: {}) {
                Label {
                    Text("New Session")
                } icon: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            }
            .padding()
        }
        .navigationTitle(exercise.name)
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ExerciseView(exercise: Exercise.sampleExercise)
        }
    }
}
