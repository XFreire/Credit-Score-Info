//
//  CreditReportRepositoryMock.swift
//  CoreTests
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation
@testable import Core

final class CreditReportRepositoryMock: CreditReportRepositoryProtocol {
    // MARK: Properties
    var reportFunctionCalled = false
    
    func report(then completion: @escaping ReportCallback, catchError: @escaping ErrorCallback) {
        
        reportFunctionCalled = true
        
        let data = try! LocalDataReader().readFile(named: "report", ofType: "json")
        let report = try! JSONDecoder().decode(CreditReport.self, from: data)
        completion(report)
    }
}
