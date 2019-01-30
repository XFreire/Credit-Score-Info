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
    
    func report(then completion: ReportCallback, catchError: ErrorCallback)
}
