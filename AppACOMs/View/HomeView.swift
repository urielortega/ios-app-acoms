//
//  HomeView.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 31/07/23.
//

import SwiftUI

enum FilterType {
case none, acom, department
}

enum SortType {
case defaultOrder, name, date
}

let searchTypes = ["Por nombre", "Por código"]

struct HomeActivityCardView: View {
    let activity: Activity
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.secondary.opacity(0.15))
                .frame(height: 120)
                .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.30), radius: 8)
            
            HStack {
                Image(activity.creditType.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                                                          
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

struct AvailableActivitiesListView: View {
    var activities: [Activity]
    
    @Environment(\.isSearching) var isSearching
    @Binding var searchText: String
    @Binding var searchType: String
    
    var body: some View {
        if isSearching {
            Picker("Modo de búsqueda", selection: $searchType) {
                ForEach(searchTypes, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
        }
        
        Divider() // To fix the transparent TabBar issue.
            .frame(width: 0)
        
        VStack {
            ScrollView {
                ForEach(activities) { activity in
                    NavigationLink {
                        // TODO: Change to DetailView()
                        Text("Hi there!")
                    } label: {
                        HomeActivityCardView(activity: activity)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct HomeView: View {
    @State private var isShowingSortOptions = false
    @State private var isShowingFilterOptions = false
    
    @State private var filter = FilterType.none
    @State private var sortOrder = SortType.defaultOrder
    
    @State private var searchText = ""
    @State private var searchType = "Por nombre"
    
    @StateObject private var viewModel = ViewModel()
        
    var body: some View {
        NavigationStack {
            AvailableActivitiesListView(
                activities: filteredActivities,
                searchText: $searchText,
                searchType: $searchType
            )
            .searchable(text: $searchText, prompt: "Buscar")
            .navigationTitle("Inicio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingFilterOptions = true
                    } label: {
                        Label("Filtrar", systemImage: "line.3.horizontal.decrease")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingSortOptions = true
                    } label: {
                        Label("Ordenar", systemImage: "arrow.up.arrow.down")
                    }
                }
            }
        }
    }
    
    var filteredActivities: [Activity] {
        let result: [Activity]

        switch(sortOrder) {
        case .defaultOrder:
            result = viewModel.activities
        case .name:
            result = viewModel.activities.sorted { $0.name < $1.name }
        case .date:
            result = viewModel.activities.sorted { $0.startDate < $1.startDate }
        }
        
        if searchText.isEmpty {
            return result
        } else {
            if searchType == "Por nombre" {
                return result.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            } else {
                return result.filter { $0.code.localizedCaseInsensitiveContains(searchText) }
            }
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
        HomeActivityCardView(activity: .example)
    }
}
