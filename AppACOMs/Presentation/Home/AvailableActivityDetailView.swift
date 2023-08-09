//
//  AvailableActivityDetailView.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 03/08/23.
//

import SwiftUI

struct AvailableActivityDetailView: View {
    let activity: Activity
    
    var body: some View {
        ActivityDetailView(
            activity: activity,
            moreDetailsView: AvailableActivityMoreDetailsView(activity: activity),
            actionButton: AvailableActivityActionButton()
        )
    }
}

struct AvailableActivityMoreDetailsView: View {
    let activity: Activity
    
    var body: some View {
        VStack {
            AttributeValueDetailView(
                attribute: "Fecha de inicio:",
                value: activity.startDate.formatted(date: .abbreviated, time: .omitted)
            )
            AttributeValueDetailView(
                attribute: "Fecha de finalización:",
                value: activity.endDate.formatted(date: .abbreviated, time: .omitted)
            )
            AttributeValueDetailView(
                attribute: "Límite de alumnos:",
                value: activity.formattedParticipants
            )
        }
        .padding(.bottom)
    }
}

struct AvailableActivityActionButton: View {
    var body: some View {
        Button {
            // Request register.
        } label: {
            Text("Solicitar registro")
                .foregroundColor(.white)
                .frame(width: 250, height: 60)
                .background(.blue)
                .clipShape(Capsule())
                .padding()
        }
    }
}

struct AvailableActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableActivityDetailView(activity: .example)
    }
}
