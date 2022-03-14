//
//  REPOEvents.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/11/22.
//

import Foundation
import Combine
import CoreData

final class REPOEvents: ObservableObject {
    @Published var events: [VMEventListItem]? = nil
    
    private var subscriber = Set<AnyCancellable>()
    
    private var svcSeatGeak = SVCSeatGeek()
    
    init() {
        self.getEvents(for: "")
    }
    
    convenience init(events: [VMEventListItem]) {
        self.init()
        self.events = events
    }
    
    func updateEvents(with eventName: String) {
        self.getEvents(for: eventName)
    }
    
    //Convenience Function for Retrieving Events from API
    private func getEvents(for eventName: String) {
        svcSeatGeak.getEvents(eventName: eventName)
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
//                    print("[+] REPOEvents \t Successfully retrieved Events")
                case .failure(let error):
                    print("[-] REPOEvents \t Unable to retrieve Events", error)
                }
            } receiveValue: { (events) in
                self.events = events.map { event in
                    VMEventListItem(event: event)
                }
            }
            .store(in: &subscriber)
    }
}
