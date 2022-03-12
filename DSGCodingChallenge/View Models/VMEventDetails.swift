//
//  VMEventDetails.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import Foundation

struct VMEventDetails {
    let title: String
    let imageString: String?
    let location: String
    let date: Date
//    let liked: Bool
    
    init(event: VMEventListItem) {
        self.title = event.title
        self.imageString = event.imageString
        self.location = event.location
        self.date = event.date
    }
}
