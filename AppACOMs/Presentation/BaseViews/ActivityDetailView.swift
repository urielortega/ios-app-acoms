//
//  ActivityDetailView.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 03/08/23.
//

import SwiftUI

struct AttributeValueDetailView: View {
    let attribute: String
    let value: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(attribute)
                .bold()
            Spacer()
            Text(value)
                .multilineTextAlignment(.trailing)
        }
        .padding(.vertical, 1)
    }
}

struct ActivityDetailView<DetailsContent: View, ButtonContent: View>: View {
    let activity: Activity
    let moreDetailsView: DetailsContent
    let actionButton: ButtonContent
    
    var body: some View {
        ScrollView {
           VStack {
               // Activity header:
               Image(activity.creditType.image)
                   .resizable()
                   .frame(width: 150, height: 150)
               VStack {
                   Text(activity.name)
                       .font(.largeTitle).bold()
                       .multilineTextAlignment(.center)
                       .padding(.bottom, 1)
                   Text(activity.description)
                       .multilineTextAlignment(.center)
               }
               .padding(.bottom)
               
               // Basic activity details:
               VStack {
                   AttributeValueDetailView(
                       attribute: "Departamento:",
                       value: activity.department
                   )
                   AttributeValueDetailView(
                       attribute: "Responsable:",
                       value: activity.responsible
                   )
                   AttributeValueDetailView(
                       attribute: "Créditos:",
                       value: activity.formattedCredits
                   )
                   AttributeValueDetailView(
                       attribute: "Tipo de créditos:",
                       value: activity.creditType.name
                   )
               }
               .padding(.bottom)
               
               // More activity details:
               moreDetailsView
                
               actionButton
           }
           .padding([.bottom, .horizontal])
        }

    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(
            activity: .example,
            moreDetailsView: AvailableActivityMoreDetailsView(activity: .example),
            actionButton: Button("Example button") {  }
        )
    }
}
