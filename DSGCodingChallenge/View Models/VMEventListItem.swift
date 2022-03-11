//
//  VMEventListItem.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import Foundation

struct VMEventListItem: Identifiable {
    var id = UUID()
    let imageString: String?
    let title: String
    let location: String
    let date: Date
    
    init(event: Event) {
        self.imageString = event.performers[0].image!
        self.title = event.title
        self.location = event.venue.address + ", " + event.venue.state
        
        let isoDate = "2020-01-22T11:22:00+0000"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: isoDate) {
            self.date = date
        } else {
            self.date = Date()
        }
    }
}
