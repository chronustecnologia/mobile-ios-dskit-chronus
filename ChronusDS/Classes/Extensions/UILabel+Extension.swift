//
//  UILabel+Extension.swift
//  ChronusDS
//
//  Created by José Júlio Júnior on 27/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public extension UILabel {
    
    func setParagraphStyle(lineKern: CGFloat = 0.0,lineHeightMultiple: CGFloat = 0.0, lineSpacing: CGFloat = 0.0) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        paragraphStyle.lineSpacing = lineSpacing
        let attText = self.attributedText ?? NSAttributedString(string: self.text ?? "")
        let mutableAttString: NSMutableAttributedString = NSMutableAttributedString(attributedString: attText)
        mutableAttString.addAttributes([NSAttributedString.Key.kern: lineKern, NSAttributedString.Key.paragraphStyle: paragraphStyle], range: NSMakeRange(0, attText.string.count))
        self.attributedText = mutableAttString
    }
}
