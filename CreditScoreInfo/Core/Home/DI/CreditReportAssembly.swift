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
    private let webServiceAssembly: WebServiceAssembly
    
    // MARK: Initialization
    init(webServiceAssembly: WebServiceAssembly) {
        self.webServiceAssembly = webServiceAssembly
    }
    
    public func viewController() -> UIViewController {
        return ScoreViewController(presenter: presenter(), scoreViewPresenter: scoreViewPresenter())
    }
    
    func presenter() -> CreditReportPresenterProtocol {
        return CreditReportPresenter(repository: repository())
    }
    
    func repository() -> CreditReportRepositoryProtocol {
        return CreditReportRepository(webService: webServiceAssembly.webService)
    }
    
    func scoreViewPresenter() -> ScoreViewPresenter {
        return ScoreViewPresenter()
    }
}
