//
//  AcomsView-ViewModel.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 08/08/23.
//

import Foundation

extension AcomsView {
    @MainActor class ViewModel: ObservableObject {
        @Published var completedActivities = CompletedActivity.examples
        @Published var requestedActivities = RequestedActivity.examples

        @Published var selectedAcomsTab: AcomsTab = .requested
    }
}
