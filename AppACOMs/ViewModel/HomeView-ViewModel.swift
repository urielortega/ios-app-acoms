//
//  HomeView-ViewModel.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 31/07/23.
//

import Foundation

extension HomeView {
    @MainActor class ViewModel: ObservableObject {
        @Published var activities = Activity.examples
    }
}
