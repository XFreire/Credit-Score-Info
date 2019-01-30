//
//  CreditReportAssembly.swift
//  Core
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

final public class CreditReportAssembly {
    
    // MARK: Properties
    private let webServiceAssemby: WebServiceAssembly
    
    // MARK: Initialization
    init(webServiceAssemby: WebServiceAssembly) {
        self.webServiceAssemby = webServiceAssemby
    }
    
    public func viewController() -> UIViewController {
        return ScoreViewController(presenter: presenter(), scoreViewPresenter: scoreViewPresenter())
    }
    
    func presenter() -> CreditReportPresenterProtocol {
        return CreditReportPresenter(repository: repository())
    }
    
    func repository() -> CreditReportRepositoryProtocol {
        return CreditReportRepository(webService: webServiceAssemby.webService)
    }
    
    func scoreViewPresenter() -> ScoreViewPresenter {
        return ScoreViewPresenter()
    }
}
