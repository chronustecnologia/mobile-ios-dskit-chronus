//
//  ChronusTheme.swift
//  ChronusDS
//
//  Created by Julio on 24/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

public enum ChronusTheme {
    case white
    case black
    case red
    case green
    case blue
}

public protocol Themeable {
    var theme: ChronusTheme { get set }
    func setTheme(_ isPressed: Bool)
}

public extension Themeable where Self: UILabel {
    func setTheme(_ isPressed: Bool = false) {
        guard self.isEnabled else {
            self.textColor = ChronusColor.gray
            return
        }
        
        switch theme {
        case .white:
            self.textColor = ChronusColor.white
        case .black:
            self.textColor = ChronusColor.black
        case .red:
            self.textColor = ChronusColor.red
        case .green:
            self.textColor = ChronusColor.green
        case .blue:
            self.textColor = ChronusColor.blue
        }
    }
}

public extension Themeable where Self: ChronusButton {
    func setTheme(_ isPressed: Bool = false) {
        guard self.isEnabled else {
            self.setTitleColor(ChronusColor.gray, for: .normal)
            self.backgroundColor = ChronusColor.lightGray
            return
        }
        
        var textColor: UIColor = ChronusColor.white
        var backgroundColor: UIColor?

        switch theme {
        case .blue:
            backgroundColor = isPressed ? ChronusColor.darkBlue : ChronusColor.blue
        case .black:
            backgroundColor = isPressed ? ChronusColor.primaryDarkGray : ChronusColor.black
        case .red:
            backgroundColor = isPressed ? ChronusColor.darkRed : ChronusColor.red
        case .green:
            backgroundColor = isPressed ? ChronusColor.darkGreen : ChronusColor.green
        case .white:
            backgroundColor = isPressed ? ChronusColor.offWhite : ChronusColor.white
            textColor = ChronusColor.black
        }
        
        self.setTitleColor(textColor, for: .normal)
        self.imageView?.tintColor = textColor
        
        self.backgroundColor = backgroundColor
        self.tintColor = textColor
    }
}
