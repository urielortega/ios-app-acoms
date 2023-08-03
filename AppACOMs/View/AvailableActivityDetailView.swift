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
        Text(activity.name)
    }
}

struct AvailableActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AvailableActivityDetailView(activity: .example)
    }
}
