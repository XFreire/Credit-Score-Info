//
//  ScoreViewPresenter.swift
//  Core
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation

final class ScoreViewPresenter {
    func present(_ report: CreditReport, in scoreView: ScoreView) {
        scoreView.titleLabel.text = "Your credit score is".localized
        scoreView.scoreLabel.text = "\(report.score)"
        let maxValue = "our of".localized
        scoreView.maxScoreValueLabel.text = "\(maxValue) \(report.maxScoreValue)"
    }
}
