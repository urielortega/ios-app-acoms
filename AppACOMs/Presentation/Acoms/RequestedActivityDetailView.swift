//
//  RequestedActivityDetailView.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 09/08/23.
//

import SwiftUI

struct RequestedActivityDetailView: View {
    let requestedActivity: RequestedActivity

    var body: some View {
        ActivityDetailView(
            activity: requestedActivity.activity,
            moreDetailsView: RequestedActivityMoreDetailsView(requestedActivity: requestedActivity),
            actionButton: RequestedActivityActionButton(requestedActivity: requestedActivity)
        )
    }
}

struct RequestedActivityMoreDetailsView: View {
    let requestedActivity: RequestedActivity
    
    var body: some View {
        VStack {
            AttributeValueDetailView(
                attribute: "Fecha de inicio:",
                value: requestedActivity.activity.startDate.formatted(date: .abbreviated, time: .omitted)
            )
            AttributeValueDetailView(
                attribute: "Fecha de finalización:",
                value: requestedActivity.activity.endDate.formatted(date: .abbreviated, time: .omitted)
            )
            .padding(.bottom)
            
            HStack(alignment: .top) {
                Text("Estado de la solicitud")
                    .bold()
                Spacer()
                HStack {
                    Circle()
                        .foregroundColor(requestedActivity.requestStatus.color)
                        .frame(width: 15)
                    
                    Text(requestedActivity.requestStatus.rawValue)
                        .multilineTextAlignment(.trailing)
                }
            }
            .padding(.vertical, 1)
        }
        .padding(.bottom)
    }
}

struct RequestedActivityActionButton: View { // TODO: Modify design to pure text button.
    let requestedActivity: RequestedActivity

    var body: some View {
        if requestedActivity.requestStatus == .underReview {
            Button {
                // Cancel request.
            } label: {
                Text("Cancelar solicitud")
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}

struct RequestedActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RequestedActivityDetailView(requestedActivity: .example)
    }
}
