//
//  CreditReportPresenterMock.swift
//  CoreTests
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation
@testable import Core

final class CreditReportPresenterMock: CreditReportPresenter {
    
    // MARK: Properties
    var didLoadCalled: Bool = false
    
    override func didLoad() {
        super.didLoad()
        didLoadCalled = true
    }
}
