//
//  CompletedActivity.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 08/08/23.
//

import Foundation

struct CompletedActivity: Identifiable, Codable {
    var id = UUID()

    let activity: Activity
    var fileRoute: String // To access the PDF stored in the server.
    var downloadFileStatus: DownloadFileStatus
    
    static let example = CompletedActivity(
        activity: .example,
        fileRoute: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
        downloadFileStatus: .available
    )
    
    static let examples = [
        CompletedActivity(
            activity: Activity.examples[1],
            fileRoute: "",
            downloadFileStatus: .unavailable
        ),
        .example,
        CompletedActivity(
            activity: Activity.examples[3],
            fileRoute: "",
            downloadFileStatus: .unavailable
        )
    ]
}
