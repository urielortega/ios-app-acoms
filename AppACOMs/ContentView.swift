//
//  ContentView.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 31/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Inicio", systemImage: "house.fill") }
                .tag("Home")
            
            AcomsView()
                .tabItem { Label("ACOMs", systemImage: "doc.text.fill") }
                .tag("Acoms")
            
            ProgressView()
                .tabItem { Label("Progreso", systemImage: "chart.xyaxis.line") }
                .tag("Progress")
            
            ProfileView()
                .tabItem { Label("Perfil", systemImage: "person.fill") }
                .tag("Profile")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
