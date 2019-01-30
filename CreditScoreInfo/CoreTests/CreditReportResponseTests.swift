//
//  CreditReportResponseTests.swift
//  CoreTests
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Core

class CreditReportResponseTests: XCTestCase {

    var response: CreditReportResponse!
    
    override func setUp() {
        let reader = LocalDataReader()
        let data = try! reader.readFile(named: "report_response", ofType: "json")
        let decoder = JSONDecoder()
        
        response = try? decoder.decode(CreditReportResponse.self, from: data)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreditRecordResponseExistence() {
        XCTAssertNotNil(response)
    }

}
