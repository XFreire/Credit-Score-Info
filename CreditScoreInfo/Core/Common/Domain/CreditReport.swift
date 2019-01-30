//
//  CreditReport.swift
//  Core
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation

struct CreditReport: Decodable {
    
    // MARK: Properties
    let score: Int
    let maxScoreValue: Int
    let minScoreValue: Int
}
