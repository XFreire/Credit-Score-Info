//
//  CreditReportPresenterTests.swift
//  CoreTests
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Core

class CreditReportPresenterTests: XCTestCase {

    var presenter: CreditReportPresenterProtocol!
    var repository: CreditReportRepositoryMock!
    
    override func setUp() {
        repository = CreditReportRepositoryMock()
        presenter = CreditReportPresenterMock(repository: repository)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreditReportPresenter_DidLoad_TheRepositoryIsCalled() {
        presenter.didLoad()
        XCTAssertTrue(repository.reportFunctionCalled)
    }

}
