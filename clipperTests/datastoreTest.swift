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
        let prevCount = ds.numOfItems()
        ds.add(value:"test copy value")
        XCTAssertEqual(ds.numOfItems(), prevCount + 1)
    }

    func testDatastoreCanDedupeNewData(){
        let ds = Datastore.uniqueDatastore()
        let data = "dupeData"
        ds.add(value: data)
        ds.add(value: data)
        XCTAssertEqual(ds.numOfItems(), 1)

    }

    func testDatastoreCanDedupeComplexNewData(){
        let ds = Datastore.uniqueDatastore()
        let data = "dupeData"
        let otherData = "all the small things"
        ds.add(value: data)
        ds.add(value: otherData)
        ds.add(value: data)
        XCTAssertEqual(ds.numOfItems(), 2)
        XCTAssertEqual(ds.data[0].data, data)
        XCTAssertEqual(ds.data[1].data, otherData)



    }

}
