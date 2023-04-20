//
//  Localizable.swift
//  AppViewCode
//
//  Created by Julio on 18/04/23.
//

import Foundation

protocol Localizable {
    var tableName: String { get }

    func string(_ arguments: [CVarArg]) -> String
    func string(_ arguments: CVarArg...) -> String
}

extension Localizable where Self: RawRepresentable, Self.RawValue == String {
    func string(_ arguments: [CVarArg] = []) -> String {
        rawValue.localized(tableName: tableName, arguments: arguments)
    }

    func string(_ arguments: CVarArg...) -> String {
        rawValue.localized(tableName: tableName, arguments: arguments)
    }
}
