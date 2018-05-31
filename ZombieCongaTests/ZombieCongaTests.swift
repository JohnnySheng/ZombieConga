//
//  ZombieCongaTests.swift
//  ZombieCongaTests
//
//  Created by Yuangang Sheng on 2018/5/26.
//  Copyright © 2018年 Johnny. All rights reserved.
//

import XCTest
@testable import ZombieConga

class ZombieCongaTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testPlus() {
        let testPoint1 = CGPoint(x: 30, y: 40)
        let testPoint2 = CGPoint(x: 23.3, y: 89.3)
        let resultPoint = testPoint1 + testPoint2
        XCTAssertEqual(resultPoint.x, 53.3)
        XCTAssertEqual(resultPoint.y, 129.3)
    }
    
    func testPlusEqual() {
        var testPoint1 = CGPoint(x: 30, y: 40)
        let testPoint2 = CGPoint(x: 23.3, y: 89.3)
        testPoint1 += testPoint2
        XCTAssertEqual(testPoint1.x, 53.3)
        XCTAssertEqual(testPoint1.y, 129.3)
    }

    
    func testMinus() {
        let testPoint1 = CGPoint(x: 30, y: 40)
        let testPoint2 = CGPoint(x: 13.4, y: 89.3)
        let resultPoint = testPoint1 - testPoint2
        XCTAssertEqual(resultPoint.x, 16.6)
        XCTAssertEqual(resultPoint.y, -49.3)
    }
    
    func testMinusEqual() {
        var testPoint1 = CGPoint(x: 30, y: 40)
        let testPoint2 = CGPoint(x: 13.4, y: 89.3)
        testPoint1 -= testPoint2
        XCTAssertEqual(testPoint1.x, 16.6)
        XCTAssertEqual(testPoint1.y, -49.3)
    }
    
    func testMulScalar() {
        let testPoint1 = CGPoint(x: 23.3, y: 89.3)
        let resultPoint = testPoint1 * 2
        XCTAssertEqual(resultPoint.x, 46.6)
        XCTAssertEqual(resultPoint.y, 178.6)
    }
    
    func testMulPoint() {
        let testPoint1 = CGPoint(x: 23.3, y: 89.3)
        let testPoint2 = CGPoint(x: 20, y: 12)
        let resultPoint = testPoint1 * testPoint2
        XCTAssertEqual(resultPoint.x, 466)
        XCTAssertEqual(resultPoint.y, 1071.6)
    }
    
    func testPointExtension() {
        let testPoint1 = CGPoint(x: 3, y: 4)
        XCTAssertEqual(testPoint1.length(), 5)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
