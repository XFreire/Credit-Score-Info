//
//  ScoreViewController.swift
//  Core
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController, CreditReportView {

    // MARK: - Outlets
    @IBOutlet var loadingView: UIActivityIndicatorView!
    @IBOutlet var scoreViewContainer: UIStackView!
    
    private var scoreView: ScoreView! {
        didSet {
            let width = Double(scoreView.frame.width)
            scoreView.cornerRadius = width / 2
            scoreView.borderWidth = 1
            scoreView.borderColor = .darkGray
        }
    }
    
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
        setupViews()
        presenter.view = self
        presenter.didLoad()
    }
    
    func setupViews() {
        scoreView = ScoreView.instantiate()
        scoreViewContainer.subviews.forEach{ $0.removeFromSuperview() }
        scoreViewContainer.addArrangedSubview(scoreView)
    }

    func setLoading(_ loading: Bool) {
        scoreViewContainer.isHidden = loading
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
