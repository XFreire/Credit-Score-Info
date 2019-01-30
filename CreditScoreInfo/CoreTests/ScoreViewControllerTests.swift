//
//  ScoreViewControllerTests.swift
//  CoreTests
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Core
class ScoreViewControllerTests: XCTestCase {

    var viewControllerMock: ScoreViewControllerMock!
    var presenter: CreditReportPresenterMock!
    var scoreViewPresenter: ScoreViewPresenter!
    var repositoryMock: CreditReportRepositoryProtocol!
    
    override func setUp() {
        repositoryMock = CreditReportRepositoryMock()
        presenter = CreditReportPresenterMock(repository: repositoryMock)
        scoreViewPresenter = ScoreViewPresenter()
        viewControllerMock = ScoreViewControllerMock(presenter: presenter, scoreViewPresenter: scoreViewPresenter)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testScoreViewController_ViewDidLoad_CallsPresenterDidLoasAndAsignView() {
        viewControllerMock.loadView()
        viewControllerMock.viewDidLoad()
        
        XCTAssertNotNil(presenter.view)
        XCTAssertEqual(presenter.didLoadCalled, true)
    }
    
    func testScoreViewController_ViewDidLoad_SetupViewsIsCalled() {
        viewControllerMock.loadView()
        viewControllerMock.viewDidLoad()
        XCTAssertTrue(viewControllerMock.setupViewsCalled)
    }
    
    func testScoreViewController_ViewDidLoad_HiddenViewsAreCorrect() {
        viewControllerMock.loadView()
        viewControllerMock.viewDidLoad()
        XCTAssertTrue(viewControllerMock.loadingView.isHidden)
        XCTAssertFalse(viewControllerMock.scoreViewContainer.isHidden)
    }
    
    func testScoreViewController_ViewDidLoad_ShowReportIsCalled() {
        viewControllerMock.loadView()
        viewControllerMock.viewDidLoad()
        XCTAssertTrue(viewControllerMock.showReportCalled.0)
    }
}
