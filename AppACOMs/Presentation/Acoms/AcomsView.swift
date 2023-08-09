//
//  AcomsView.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 31/07/23.
//

import SwiftUI

struct AcomsView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                AcomsTabPicker(acomsTab: $viewModel.selectedAcomsTab)
                    .padding(.bottom)
                
                if viewModel.selectedAcomsTab == .completed {
                    CompletedActivitiesListView(completedActivities: viewModel.completedActivities)
                } else {
                    RequestedActivitiesListView(requestedActivities: viewModel.requestedActivities)
                }
            }
            .navigationTitle("ACOMs")
        }
    }
}

struct AcomsTabPicker: View {
    @Binding var acomsTab: AcomsTab

    var body: some View {
        Picker("ACOMs", selection: $acomsTab) {
            ForEach(AcomsTab.allCases) { acomsTab in
                Text(acomsTab.rawValue)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
    }
}

struct RequestedActivityCardView: View {
    let requestedActivity: RequestedActivity

    var body: some View {
        BaseCard(height: 80) {
            HStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(requestedActivity.activity.creditType.image)
                        .resizable()
                    .frame(width: 70, height: 70)
                    
                    Group {
                        Circle()
                            .foregroundColor(requestedActivity.requestStatus.color)
                            .overlay(
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .foregroundColor(.white.opacity(0))
                            )
                    }
                    .frame(width: 14)
                    .offset(x: -16, y: -8)
                }
                                                          
                VStack(alignment: .leading) {
                    Text(requestedActivity.activity.name)
                        .font(.title3).bold()
                        .foregroundColor(.primary)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct RequestedActivitiesListView: View {
    var requestedActivities: [RequestedActivity]
    
    var body: some View {
        ScrollView {
            if requestedActivities.isEmpty {
                Text("No hay resultados 🙁")
                    .font(.subheadline)
                    .bold()
                    .padding(.top, 40)
            } else {
                ForEach(requestedActivities) { requestedActivity in
                    NavigationLink {
                        #warning("The toolbar modifier might freeze the app.")
                        RequestedActivityDetailView(requestedActivity: requestedActivity)
                            // .toolbar(.hidden, for: .tabBar) // To hide the tabBar.
                    } label: {
                        RequestedActivityCardView(requestedActivity: requestedActivity)
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


struct CompletedActivityCardView: View {
    let completedActivity: CompletedActivity
    
    var body: some View {
        BaseCard(height: 80) {
            HStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(completedActivity.activity.creditType.image)
                        .resizable()
                    .frame(width: 70, height: 70)
                    
                    Group {
                        Circle()
                            .foregroundColor(completedActivity.downloadFileStatus.color)
                            .overlay(
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .foregroundColor(.white.opacity(0))
                            )
                    }
                    .frame(width: 14)
                    .offset(x: -16, y: -8)
                }
                                                          
                VStack(alignment: .leading) {
                    Text(completedActivity.activity.name)
                        .font(.title3).bold()
                        .foregroundColor(.primary)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct CompletedActivitiesListView: View {
    var completedActivities: [CompletedActivity]
    
    var body: some View {
        ScrollView {
            if completedActivities.isEmpty {
                Text("No hay resultados 🙁")
                    .font(.subheadline)
                    .bold()
                    .padding(.top, 40)
            } else {
                ForEach(completedActivities) { completedActivity in
                    NavigationLink {
                        #warning("The toolbar modifier might freeze the app.")
                        CompletedActivityDetailView(completedActivity: completedActivity)
                            // .toolbar(.hidden, for: .tabBar) // To hide the tabBar.
                    } label: {
                        CompletedActivityCardView(completedActivity: completedActivity)
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

struct AcomsView_Previews: PreviewProvider {
    static var previews: some View {
        AcomsView()
    }
}

struct AcomsActivityCardView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedActivityCardView(completedActivity: .example)
    }
}
