//
//  ContentView.swift
//  GymProgress
//
//  Created by Anshul Kanwar on 08/06/23.
//

import SwiftUI

struct ExerciseListView: View {
    @ObservedObject private var exerciseListViewModel = ExerciseListViewModel()
    
    var body: some View {
        // TODO: Show another view in case of no exercises
        List(exerciseListViewModel.exercises) { exercise in
            NavigationLink(exercise.name) {
                ExerciseView(exercise: exercise)
            }
        }
        .onAppear {
            exerciseListViewModel.getExercises()
        }
        .navigationTitle("Exercises")
    }
}

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ExerciseListView()
        }
    }
}
