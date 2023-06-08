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
        List(exerciseListViewModel.exercises) { exercise in
            Text(exercise.name)
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
