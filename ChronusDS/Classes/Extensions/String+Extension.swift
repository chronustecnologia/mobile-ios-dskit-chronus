//
//  String+Extension.swift
//  ChronusDS
//
//  Created by José Júlio Júnior on 19/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

extension String {
    
    public func localized(tableName: String, arguments: [CVarArg] = []) -> String {
        String(format: NSLocalizedString(self, tableName: tableName, bundle: .main, comment: ""), arguments: arguments)
    }
}
