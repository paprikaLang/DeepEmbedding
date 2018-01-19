//
//  DeepEmbeddingTests.swift
//  DeepEmbeddingTests
//
//  Created by paprika on 2018/1/19.
//  Copyright © 2018年 paprika. All rights reserved.
//

import XCTest
@testable import DeepEmbedding

final class FakeAnalytics: Analytics{
    var events: [Event] = []
    func send(_ event: Event) {
        events.append(event)
    }
}
class DeepEmbeddingTests: XCTestCase {
    
    func testExample() {
        let vc = ViewController()
        let fakeAnalytics = FakeAnalytics()
        vc.analytics = fakeAnalytics
        vc.tapMeTapped(self)
        XCTAssertEqual(fakeAnalytics.events.count, 1)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
