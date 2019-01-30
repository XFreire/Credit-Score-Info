//
//  CreditReportRepository.swift
//  Core
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation

protocol CreditReportRepositoryProtocol {
    typealias ReportCallback = (CreditReport) -> Void
    typealias ErrorCallback = (Error) -> Void
    
    func report(then completion: @escaping ReportCallback, catchError: @escaping ErrorCallback)
}


final class CreditReportRepository: CreditReportRepositoryProtocol {
    
    // MARK: Properties
    private let webService: WebService
    
    // MARK: Initialization
    init(webService: WebService) {
        self.webService = webService
    }
    
    // MARK: CreditReportRepositoryProtocol
    func report(then completion: @escaping ReportCallback, catchError: @escaping ErrorCallback) {
        webService.load(CreditReportResponse.self, from: .report, then: {
            completion($0.report)
        }, catchError: {
            catchError($0)
        })
    }
}
