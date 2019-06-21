//
//  eventListnerTest.swift
//  clipperTests
//
//  Created by Wayne Irwin on 16/6/19.
//  Copyright © 2019 Wayne Irwin. All rights reserved.
//

import XCTest
@testable import clipper

class eventListnerTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testEventListenerInit(){
                let datastore = Datastore.shared
                let pasteboard = NSPasteboard.withUniqueName()
                let listner = EventListner(datastore: datastore, pasteboard: pasteboard)
                XCTAssertEqual(listner._datastore, datastore)
                XCTAssertEqual(listner._pasteboard, pasteboard)
    }

    func testHandlesNewPasteEvent() {
        let datastore = Datastore.shared
        let pasteboard = NSPasteboard.withUniqueName()
        let listner = EventListner(datastore: datastore, pasteboard: pasteboard)
        pasteboard.setData("some copy data".data(using: .utf8), forType:.string)
        let predicate = NSPredicate(block: { any, _ in

            guard let ds = any as? Datastore else { return false }
            return ds.numOfItems() == 1
        })
        expectation(for: predicate, evaluatedWith: datastore, handler: nil)
        waitForExpectations(timeout: 1, handler: nil)
    }
    
}
