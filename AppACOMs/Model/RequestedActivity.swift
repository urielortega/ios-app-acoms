//
//  RequestedActivity.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 08/08/23.
//

import Foundation

struct RequestedActivity: Identifiable, Codable {
    var id = UUID()

    let activity: Activity
    var requestStatus: RequestStatus
    
    static let example = RequestedActivity(
        activity: .example,
        requestStatus: .accepted
    )
    
    static let examples = [
        RequestedActivity(
            activity: Activity.examples[2],
            requestStatus: .underReview
        ),
        RequestedActivity(
            activity: Activity.examples[1],
            requestStatus: .accepted
        ),
        .example,
        RequestedActivity(
            activity: Activity.examples[3],
            requestStatus: .accepted
        ),
        RequestedActivity(
            activity: Activity.examples[5],
            requestStatus: .declined
        ),
    ]
}
