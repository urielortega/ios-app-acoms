//
//  HomeView.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 31/07/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
        
    var body: some View {
        NavigationStack {
            AvailableActivitiesListView(
                activities: filteredActivities,
                searchText: $viewModel.searchText,
                searchType: $viewModel.selectedSearchType
            )
            .searchable(text: $viewModel.searchText, prompt: "Buscar")
            .navigationTitle("Inicio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    // Filtering options:
                    Menu {
                        // ACOM filtering options:
                        Menu("Filtrar por ACOM") {
                            Picker(
                                "Selecciona una opción de filtrado por ACOM",
                                selection: $viewModel.selectedFilter
                            ) {
                                ForEach(
                                    FilterType.allCases.filter { $0.rawValue.contains("ACOM") }
                                ) { acomFilterType in
                                    Text(acomFilterType.rawValue)
                                }
                            }
                        }
                        
                        // Departament filtering options:
                        Menu("Filtrar por departamento") {
                            Picker(
                                "Selecciona una opción de filtrado por departamento",
                                selection: $viewModel.selectedFilter
                            ) {
                                ForEach(
                                    FilterType.allCases.filter { $0.rawValue.contains("Departamento") }
                                ) { departmentFilterType in
                                    Text(departmentFilterType.rawValue)
                                }
                            }
                        }
                        
                        // No filtering option:
                        Picker(
                            "Opción sin filtro",
                            selection: $viewModel.selectedFilter
                        ) {
                            ForEach(FilterType.allCases.filter { $0 == .none }) { filterType in
                                Text(filterType.rawValue)
                            }
                        }
                    } label: {
                        Label("Filtrar", systemImage: "line.3.horizontal.decrease")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    // Sorting options:
                    Menu {
                        Picker(
                            "Selecciona una opción de ordenamiento",
                            selection: $viewModel.selectedSortOrder
                        ) {
                            ForEach(SortType.allCases) { sortType in
                                Text(sortType.rawValue)
                            }
                        }
                    } label: {
                        Label("Ordenar", systemImage: "arrow.up.arrow.down")
                    }
                }
            }
        }
    }
    
    var filteredActivities: [Activity] {
        var result: [Activity]

        // Sorting:
        switch(viewModel.selectedSortOrder) {
        case .defaultOrder:
            result = viewModel.activities
        case .nameFromAToZ:
            result = viewModel.activities.sorted { $0.name < $1.name }
        case .nameFromZToA:
            result = viewModel.activities.sorted { $0.name > $1.name }
        case .fromLatestToOldest:
            result = viewModel.activities.sorted { $0.startDate < $1.startDate }
        case .fromOldestToLatest:
            result = viewModel.activities.sorted { $0.startDate > $1.startDate }
        }
        
        // Filtering:
        switch(viewModel.selectedFilter) {
        case .acom1:
            result = result.filter { $0.creditType == acom1}
        case .acom2:
            result = result.filter { $0.creditType == acom2}
        case .acom3:
            result = result.filter { $0.creditType == acom3}
        case .acom4:
            result = result.filter { $0.creditType == acom4}
        case .acom5:
            result = result.filter { $0.creditType == acom5}
        case .acom6:
            result = result.filter { $0.creditType == acom6}
        case .acom7:
            result = result.filter { $0.creditType == acom7}
        default:
            break
        }
        
        // Search:
        if viewModel.searchText.isEmpty {
            return result
        } else {
            if viewModel.selectedSearchType == .name {
                return result.filter { $0.name.localizedCaseInsensitiveContains(viewModel.searchText) }
            } else {
                return result.filter { $0.code.localizedCaseInsensitiveContains(viewModel.searchText) }
            }
        }
    }
}

struct AvailableActivityCardView: View {
    let activity: Activity
    
    var body: some View {
        BaseCard {
            HStack {
                Image(activity.creditType.image)
                    .resizable()
                    .frame(width: 80, height: 80)
                                                          
                VStack(alignment: .leading) {
                    Text(activity.name)
                        .font(.title3).bold()
                        .foregroundColor(.primary)
                    
                    Text(activity.code)
                        .font(.subheadline)
                        .padding(.bottom, 4)
                        .foregroundColor(.primary)
                    
                    Text(activity.startDate.formatted(date: .abbreviated, time: .omitted))
                        .font(.caption)
                        .foregroundColor(.primary)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct SearchTypePicker: View {
    @Binding var searchType: SearchType

    var body: some View {
        Picker("Modo de búsqueda", selection: $searchType) {
            ForEach(SearchType.allCases) { searchType in
                Text(searchType.rawValue)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
}

struct AvailableActivitiesListView: View {
    var activities: [Activity]
    
    @Environment(\.isSearching) var isSearching
    @Binding var searchText: String
    @Binding var searchType: SearchType
    
    var body: some View {
        if isSearching {
            SearchTypePicker(searchType: $searchType)
        }
        
        Divider() // To fix the transparent TabBar issue.
            .frame(width: 0)
        
        VStack {
            ScrollView {
                if activities.isEmpty {
                    Text("No hay resultados 🙁")
                        .font(.subheadline)
                        .bold()
                        .padding(.top, 40)
                } else {
                    ForEach(activities) { activity in
                        NavigationLink {
                            #warning("The toolbar modifier might freeze the app.")
                            AvailableActivityDetailView(activity: activity)
                                 // .toolbar(.hidden, for: .tabBar) // To hide the tabBar.
                        } label: {
                            AvailableActivityCardView(activity: activity)
                        }
                    }
                }
            }
            .refreshable {
                print("Refreshing...")
            }
            .padding(.horizontal)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct Previews_HomeView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableActivityCardView(activity: .example)
    }
}
