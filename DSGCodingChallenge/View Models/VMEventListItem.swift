//
//  VMEventListItem.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/10/22.
//

import Foundation
import SwiftUI

class VMEventListItem: Identifiable, ObservableObject {
    var id: Int
    var imageString: String?
    var title: String
    var location: String
    var date: Date
    
    init(event: DTOEvent) {
        self.imageString = event.performers[0].image
        self.title = event.title
        self.location = event.venue.address + ", " + event.venue.state
        self.id = event.id
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date(from: event.datetime_local) {
            self.date = date
        } else {
            self.date = Date()
        }
    }
}
