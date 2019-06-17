//
//  DatastoreTest.swift
//  clipperTests
//
//  Created by Wayne Irwin on 16/6/19.
//  Copyright © 2019 Wayne Irwin. All rights reserved.
//

import XCTest
@testable import clipper

class datastoreTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDatastoreSharedIsSingelton() {
        let ds0:Datastore = Datastore.shared
        let ds1:Datastore = Datastore.shared
        XCTAssertEqual(ds0, ds1)

    }
    
    func testDatastoreAcceptsNewData(){
        let ds = Datastore.shared
        ds.add(value:"test copy value")
        XCTAssertEqual(ds.numOfItems(), 1)
    }

}
