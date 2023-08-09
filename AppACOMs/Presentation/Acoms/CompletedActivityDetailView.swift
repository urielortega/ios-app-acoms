//
//  CompletedActivityDetailView.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 08/08/23.
//

import SwiftUI

struct CompletedActivityDetailView: View {
    let completedActivity: CompletedActivity
    @State private var showSafari: Bool = false

    var body: some View {
        ActivityDetailView(
            activity: completedActivity.activity,
            moreDetailsView: CompletedActivityMoreDetailsView(completedActivity: completedActivity),
            actionButton: CompletedActivityActionButton(
                completedActivity: completedActivity,
                showSafari: $showSafari
            )
        )
        .fullScreenCover(isPresented: $showSafari) {
            SFSafariViewWrapper(url: URL(string: completedActivity.fileRoute)!)
        }
    }
}

struct CompletedActivityMoreDetailsView: View {
    let completedActivity: CompletedActivity
    
    var body: some View {
        VStack {
            AttributeValueDetailView(
                attribute: "Fecha de inicio:",
                value: completedActivity.activity.startDate.formatted(date: .abbreviated, time: .omitted)
            )
            AttributeValueDetailView(
                attribute: "Fecha de finalización:",
                value: completedActivity.activity.endDate.formatted(date: .abbreviated, time: .omitted)
            )
        }
        .padding(.bottom)
    }
}

struct CompletedActivityActionButton: View {
    // Uncomment to open file with openURL:
    // @Environment(\.openURL) var openURL
    
    let completedActivity: CompletedActivity
    @Binding var showSafari: Bool

    var body: some View {
        Button {
            // Open file with openURL:
            // openURL(URL(string: completedActivity.fileRoute)!)
            
            // Open file with SFSafariViewController:
            showSafari.toggle()
        } label: {
            Text("Descargar constancia")
                .foregroundColor(.white)
                .frame(width: 250, height: 60)
                .background(
                    completedActivity.downloadFileStatus == .available ? .blue : .gray.opacity(0.3)
                )
                .clipShape(Capsule())
                .padding()
        }
        .disabled(completedActivity.downloadFileStatus == .unavailable)
    }
}

struct CompletedActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedActivityDetailView(completedActivity: .example)
    }
}
