//
//  ChronusCurrencyMask.swift
//  ChronusDS
//
//  Created by Julio on 24/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public class ChronusCurrencyMask: NSObject, TextMaskProtocol {
    
    lazy var allowedChars = "0123456789"
    public var maxDigits: Int = 15
    
    public func maskedText(for text: String?) -> String? {
        guard let text = text else { return "R$ 0,00" }
        let cleanText = text.filter(allowedChars.contains).prefix(maxDigits)
        guard cleanText.count > 0 else { return nil }
        guard let double = Double(cleanText) else { return nil }
        let centsDouble = double / 100
        return centsDouble.currencyValue()
    }
}
