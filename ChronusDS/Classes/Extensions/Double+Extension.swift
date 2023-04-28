//
//  Double+Extension.swift
//  ChronusDS
//
//  Created by José Júlio Júnior on 19/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

public extension Double {
    
    func currencyValue() -> String {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.alwaysShowsDecimalSeparator = true
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
    func currencyAccessibility() -> String {
        let strValue = String(format: "%.2f", self)
        let separated = strValue.split(separator: ".")
        guard separated.count == 2,
              let intString = separated.first,
              let centsString = separated.last else {
                return strValue
              }
        return "\(intString) reais e \(centsString) centavos"
    }
}
