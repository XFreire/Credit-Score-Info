//
//  ScorePresenter.swift
//  Core
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation

protocol CreditReportView: class {
    func setLoading(_ loading: Bool)
    func show(report: CreditReport)
    func show(error: Error)
}

protocol CreditScorePresenterProtocol {
    var view: CreditReportView { get set }
    func didLoad()
}


