//
//  Activity.swift
//  AppACOMs
//
//  Created by Uriel Ortega on 31/07/23.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id = UUID()
    let code: String
    let name: String
    let creditType: Acom
    let description: String
    let participants: Int
    let credits: Double
    let department: String
    let startDate: Date
    let endDate: Date
    let responsible: String
    
    var formattedCredits: String {
        String(credits)
    }
    
    var formattedParticipants: String {
        String(participants)
    }
    
    static let example = Activity(
        code: "AC3EXPL",
        name: "ACOM 3 Example",
        creditType: acom3,
        description: """
This is an activity example for iOS App ACOMs with a super long description.
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum convallis, mauris et gravida gravida, elit ante sagittis dui, sit amet venenatis tortor tellus maximus sapien. Ut a risus tempus, lacinia ipsum non, luctus ipsum. Ut lobortis scelerisque libero, quis ullamcorper leo elementum egestas. Mauris dapibus rhoncus vestibulum. Proin eu tincidunt risus. Nam id egestas sapien. Aenean dapibus, nisl non vestibulum molestie, odio erat lobortis erat, nec ullamcorper ligula odio et neque.
""",
        participants: 11,
        credits: 1.5,
        department: "Example department",
        startDate: Date.now.addingTimeInterval(TimeInterval(20_000)),
        endDate: Date.now.addingTimeInterval(TimeInterval(120_000)),
        responsible: "Uriel Ortega"
    )
    
    static let examples = [
        Activity(
            code: "AC6EXPL",
            name: "ACOM 6 Example",
            creditType: acom6,
            description: "This is an activity example for iOS App ACOMs",
            participants: 14,
            credits: 1.0,
            department: "Example department",
            startDate: Date.now,
            endDate: Date.now.addingTimeInterval(TimeInterval(20)),
            responsible: "Uriel Aguilar"
        ),
        Activity(
            code: "AC4EXPL",
            name: "ACOM 4 Example",
            creditType: acom4,
            description: "This is an activity example for iOS App ACOMs",
            participants: 15,
            credits: 0.5,
            department: "Example department",
            startDate: Date.now,
            endDate: Date.now.addingTimeInterval(TimeInterval(20)),
            responsible: "Uriel Ortega"
        ),
        Activity(
            code: "AC1EXPL",
            name: "ACOM 1 Example",
            creditType: acom1,
            description: "This is an activity example for iOS App ACOMs",
            participants: 10,
            credits: 0.5,
            department: "Example department",
            startDate: Date.now,
            endDate: Date.now.addingTimeInterval(TimeInterval(20)),
            responsible: "Uriel Ortega"
        ),
        Activity(
            code: "AC5EXPL",
            name: "ACOM 5 Example",
            creditType: acom5,
            description: "This is an activity example for iOS App ACOMs",
            participants: 9,
            credits: 2.0,
            department: "Example department",
            startDate: Date.now,
            endDate: Date.now.addingTimeInterval(TimeInterval(20)),
            responsible: "Uriel Aguilar"
        ),
        Activity(
            code: "AC2EXPL",
            name: "ACOM 2 Example",
            creditType: acom2,
            description: "This is an activity example for iOS App ACOMs",
            participants: 20,
            credits: 0.5,
            department: "Example department",
            startDate: Date.now,
            endDate: Date.now.addingTimeInterval(TimeInterval(20)),
            responsible: "Uriel Ortega"
        ),
        .example
    ]
}
