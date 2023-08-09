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
        
        @Published var selectedFilter: FilterType = .none
        @Published var selectedSortOrder: SortType = .defaultOrder
        @Published var selectedSearchType: SearchType = .name
        
        @Published var searchText = ""
    }
}
