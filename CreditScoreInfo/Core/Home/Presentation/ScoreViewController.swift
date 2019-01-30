//
//  ScoreViewController.swift
//  Core
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var scoreView: ScoreView!
    
    // MARK: Properties
    private var presenter: CreditReportPresenterProtocol
    private let scoreViewPresenter: ScoreViewPresenter
    
    // MARK: Initialization
    init(presenter: CreditReportPresenterProtocol, scoreViewPresenter: ScoreViewPresenter) {
        self.presenter = presenter
        self.scoreViewPresenter = scoreViewPresenter
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.view = self
        presenter.didLoad()
    }
}

extension ScoreViewController: CreditReportView {
    func setLoading(_ loading: Bool) {
        scoreView.isHidden = loading
        if loading {
            loadingView.startAnimating()
        } else {
            loadingView.stopAnimating()
        }
    }
    
    func show(report: CreditReport) {
        scoreViewPresenter.present(report, in: scoreView)
        
    }
    
    func show(error: Error) {
        add(ErrorViewController(error: error.localizedDescription))
    }
}
