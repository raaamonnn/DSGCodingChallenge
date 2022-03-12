//
//  REPOEvents.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/11/22.
//

import Foundation
import Combine

final class REPOEvents: ObservableObject {
    @Published var events: [VMEventListItem] = []
    private var subscriber = Set<AnyCancellable>()
    
    var svcSeatGeak = SVCSeatGeek()
    init() {
        svcSeatGeak.getEvents(eventName: "")
            .receive(on: DispatchQueue.main)
            .sink { (message) in
                print("Retrieving Events \(message)")
            } receiveValue: { (events) in
                self.events = events.map { VMEventListItem(event: $0)}
            }
            .store(in: &subscriber)
    }
    
    func updateEvents(with eventName: String) {
        svcSeatGeak.getEvents(eventName: eventName)
            .receive(on: DispatchQueue.main)
            .sink { (message) in
                print("Retrieving Events \(message)")
            } receiveValue: { (events) in
                self.events = events.map { VMEventListItem(event: $0)}
            }
            .store(in: &subscriber)
    }
    
//    private func getEvents(for eventName: String) {
//        svcSeatGeak.getEvents(eventName: eventName)
//            .receive(on: DispatchQueue.main)
//            .sink { (message) in
//                print("Retrieving Events \(message)")
//            } receiveValue: { (events) in
//                self.events = events.map { VMEventListItem(event: $0)}
//            }
//            .store(in: &subscriber)
//    }
}
