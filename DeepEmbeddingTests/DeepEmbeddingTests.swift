//
//  DeepEmbeddingTests.swift
//  DeepEmbeddingTests
//
//  Created by paprika on 2018/1/19.
//  Copyright © 2018年 paprika. All rights reserved.
//

import XCTest
@testable import DeepEmbedding

class DeepEmbeddingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
       let e = Event.viewWillAppear(name: "test")
        XCTAssertEqual(e.metadata["name"], "test")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
