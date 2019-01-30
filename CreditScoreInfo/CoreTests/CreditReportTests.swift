//
//  CreditReportTests.swift
//  CoreTests
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Core

class CreditReportTests: XCTestCase {

    var report: CreditReport!
    override func setUp() {
        let data = try! LocalDataReader().readFile(named: "report", ofType: "json")
        report = try? JSONDecoder().decode(CreditReport.self, from: data)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReportExistence() {
        XCTAssertNotNil(report)
    }
    
    func testReportMapping() {
        XCTAssertEqual(report.score, 514)
        XCTAssertEqual(report.maxScoreValue, 700)
        XCTAssertEqual(report.minScoreValue, 0)
    }

}
