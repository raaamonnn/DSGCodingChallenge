//
//  MockedData.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/12/22.
//

import Foundation

#if DEBUG

extension VMEventListItem {
    static let mockedData: [VMEventListItem] = [
        VMEventListItem(event: DTOEvent(id: 1, title: "Test1", datetime_local: "2022-03-12T03:30:00", venue: Venue(state: "CA", address: "My State1"), performers: [Performer(image: "https://picsum.photos/200")])),
        VMEventListItem(event: DTOEvent(id: 2, title: "Test2", datetime_local: "2023-03-12T03:30:00", venue: Venue(state: "DA", address: "My State2"), performers: [Performer(image: "https://picsum.photos/200")])),
        VMEventListItem(event: DTOEvent(id: 3, title: "Test3", datetime_local: "2024-03-12T03:30:00", venue: Venue(state: "BA", address: "My State3"), performers: [Performer(image: "https://picsum.photos/200")])),
        VMEventListItem(event: DTOEvent(id: 4, title: "Test4", datetime_local: "2025-03-12T03:30:00", venue: Venue(state: "NA", address: "My State4"), performers: [Performer(image: "https://picsum.photos/200")])) 
    ]
}
#endif
