//
//  REPOEvents.swift
//  DSGCodingChallenge
//
//  Created by Ramon Amini on 3/11/22.
//

import Foundation
import Combine

final class REPOEvents: ObservableObject {
    @Published var events: [VMEventListItem]? = nil
    private var subscriber = Set<AnyCancellable>()
    
    private var svcSeatGeak = SVCSeatGeek()
    
    init() {
        self.getEvents(for: "")
    }
    
    func updateEvents(with eventName: String) {
        self.getEvents(for: eventName)
    }
    
    //Convenience Function for Retrieving Events
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
                self.events = events.map { VMEventListItem(event: $0)}
            }
            .store(in: &subscriber)
    }
}
