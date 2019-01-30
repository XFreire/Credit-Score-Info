//
//  ReportResponse.swift
//  Core
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation

struct CreditReportResponse: Decodable {
    
    // MARK: Properties
    let report: CreditReport
    
    private enum CodingKeys: String, CodingKey {
        case report = "creditReportInfo"
    }
}
