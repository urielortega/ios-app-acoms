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
    
    static let example = Activity(
        code: "AC3EXPL",
        name: "ACOM 3 Example",
        creditType: acom3,
        description: "This is an activity example for iOS App ACOMs",
        participants: 11,
        credits: 1.5,
        department: "Example department",
        startDate: Date.now,
        endDate: Date.now.addingTimeInterval(TimeInterval(20)),
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
