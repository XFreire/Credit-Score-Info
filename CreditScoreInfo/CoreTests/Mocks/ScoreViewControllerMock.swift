//
//  ScoreViewControllerMock.swift
//  CoreTests
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit
@testable import Core

class ScoreViewControllerMock: ScoreViewController {

    // MARK: Properties
    var setLoadingCalled: Bool = false 
    var showReportCalled: (Bool, CreditReport)!
    var showErrorCalled: (Bool, Error)!
    var setupViewsCalled: Bool = false
    
    override init(presenter: CreditReportPresenterProtocol, scoreViewPresenter: ScoreViewPresenter) {
        super.init(presenter: presenter, scoreViewPresenter: scoreViewPresenter)
        loadingView = UIActivityIndicatorView(frame: .zero)
        scoreViewContainer = UIStackView(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupViews() {
        super.setupViews()
        setupViewsCalled = true
    }
    override func setLoading(_ loading: Bool) {
        super.setLoading(loading)
        setLoadingCalled = true
    }
    
    override func show(report: CreditReport) {
        super.show(report: report)
        showReportCalled = (true, report)
    }
    
    override func show(error: Error) {
        super.show(error: error)
        showErrorCalled = (true, error)
    }
}
