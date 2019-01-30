//
//  LocalDataReader.swift
//  CoreTests
//
//  Created by Alexandre Freire on 30/01/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import Foundation

final class LocalDataReader {
    
    final class Dummy {}
    
    func readFile(named name: String, ofType type: String) throws -> Data {
        let path = Bundle(for: Dummy.self).path(forResource: name, ofType: type)!
        return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
}
