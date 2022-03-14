//
//  UserCoreDataTests.swift
//  DSGCodingChallengeTests
//
//  Created by Ramon Amini on 3/13/22.
//

import XCTest
@testable import DSGCodingChallenge

var coreSut: CoreUserData!

class UserCoreDataTests: XCTestCase {

    override func setUp() {
        super.setUp()
        coreSut = CoreUserData()
    }

    override func tearDown() {
        coreSut = nil
        super.tearDown()
    }

    func test_addData() {
        coreSut.editFavoredEvents(eventId: 1)
        coreSut.loadFavoredEvents()
        XCTAssertNotNil(coreSut.favoredEvents)
        XCTAssertTrue(coreSut.contains(favoredEventId: 1))
        //deletes it again
        coreSut.editFavoredEvents(eventId: 1)
        XCTAssertFalse(coreSut.contains(favoredEventId: 1))
    }
    
    func test_deleteData() {
        //ads
        coreSut.editFavoredEvents(eventId: 2)
        coreSut.loadFavoredEvents()
        XCTAssertNotNil(coreSut.favoredEvents)
        //deletes
        coreSut.editFavoredEvents(eventId: 2)
        coreSut.loadFavoredEvents()
        XCTAssertFalse(coreSut.contains(favoredEventId: 2))
    }
}
