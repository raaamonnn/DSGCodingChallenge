//
//  Event.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import Foundation

struct Events: Codable {
    let events: [Event]
}
struct Event: Codable {
    let id: Int
    let title: String
    let datetime_local: String
    let venue: Venue
    let performers: [Performer]
}

struct Venue: Codable {
    let state: String
    let address: String
}

struct Performer: Codable {
    let image: String?
}
