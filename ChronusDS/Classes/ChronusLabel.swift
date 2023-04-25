//
//  ChronusLabel.swift
//  ChronusDS
//
//  Created by Julio on 24/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

public class ChronusLabel: UILabel, Themeable {
    
    public var theme: ChronusTheme = .black {
        didSet {
            setTheme()
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            setTheme()
        }
    }
    
    public override var text: String? {
        didSet {
            setParagraphStyle()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setTextStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setTextStyle()
    }
    
    func setTextStyle() {
        font = ChronusFont.body
        numberOfLines = 0
        setParagraphStyle()
    }
    
    func setParagraphStyle() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.05

        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: [NSAttributedString.Key.kern: -0.32, NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }
}
