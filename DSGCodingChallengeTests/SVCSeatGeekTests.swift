//
//  SVCSeatGeekTests.swift
//  SVCSeatGeekTests
//
//  Created by Ramon Amini on 3/10/22.
//

import XCTest
import Combine

@testable import DSGCodingChallenge

var svcSut: SVCSeatGeek!
private var cancellables: Set<AnyCancellable>!

class SVCSeatGeekTests: XCTestCase {
    override func setUp() {
        super.setUp()
        svcSut = SVCSeatGeek()
        cancellables = []
    }

    override func tearDown() {
        svcSut = nil
        cancellables = nil
        super.tearDown()
    }
    
    func test_emptySearch() {
        var error: Error?
        let expectation = self.expectation(description: "Loaded Events")
        var events = [DTOEvent]()
        
        svcSut.getEvents(eventName: "")
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let encounteredError):
                    error = encounteredError
                }
                expectation.fulfill()
            } receiveValue: { (eventsResult) in
                events = eventsResult
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1)
        
        XCTAssertNil(error)
        XCTAssertGreaterThan(events.count, 0)
    }
    
    func test_eventSearch() {
        var error: Error?
        let expectation = self.expectation(description: "Loaded Events")
        var events = [DTOEvent]()
        
        svcSut.getEvents(eventName: "Swift")
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let encounteredError):
                    error = encounteredError
                }
                expectation.fulfill()
            } receiveValue: { (eventsResult) in
                events = eventsResult
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1)
        
        XCTAssertNil(error)
        XCTAssertGreaterThan(events.count, 0)
    }
    
    func test_badSearch() {
        var error: Error?
        let expectation = self.expectation(description: "Loaded Events")
        var events = [DTOEvent]()
        
        svcSut.getEvents(eventName: "%")
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let encounteredError):
                    error = encounteredError
                }
                expectation.fulfill()
            } receiveValue: { (eventsResult) in
                events = eventsResult
            }
            .store(in: &cancellables)
        
        waitForExpectations(timeout: 1)
        
        XCTAssertNotNil(error)
        XCTAssertEqual(events.count, 0)
        
    }
}
