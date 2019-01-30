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

protocol CreditReportPresenterProtocol {
    var view: CreditReportView? { get set }
    func didLoad()
}

class CreditReportPresenter: CreditReportPresenterProtocol {
    
    // MARK: Properties
    private let repository: CreditReportRepositoryProtocol
    weak var view: CreditReportView?
    
    // MARK: Initialization
    init(repository: CreditReportRepositoryProtocol) {
        self.repository = repository
    }
    
    // MARK: CreditReportPresenterProtocol
    func didLoad() {
        view?.setLoading(true)
        repository.report(then: { [weak self] in
            guard let self = self else { return }
            self.view?.setLoading(false)
            self.view?.show(report: $0)
        }, catchError: {
            self.view?.setLoading(false)
            self.view?.show(error: $0)
        })
    }
    
    
    
}


