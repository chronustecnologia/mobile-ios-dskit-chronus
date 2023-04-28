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
        case .red:
            backgroundColor = isPressed ? ChronusColor.darkRed : ChronusColor.red
        case .green:
            backgroundColor = isPressed ? ChronusColor.darkGreen : ChronusColor.green
        case .blue:
            backgroundColor = isPressed ? ChronusColor.darkBlue : ChronusColor.blue
        case .black:
            backgroundColor = isPressed ? ChronusColor.primaryDarkGray : ChronusColor.black
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

public extension Themeable where Self: ChronusBgButton {
    func setTheme(_ isPressed: Bool = false) {
        guard isPressed else {
            self.backgroundColor = .clear
            return
        }
        
        switch theme {
        case .red:
            backgroundColor = ChronusColor.darkRed
        case .green:
            backgroundColor = ChronusColor.darkGreen
        case .blue:
            backgroundColor = ChronusColor.darkBlue
        case .black:
            backgroundColor = ChronusColor.primaryDarkGray
        case .white:
            backgroundColor = ChronusColor.offWhite
        }
    }
}

public extension Themeable where Self: ChronusIconButton {
    func setTheme(_ isPressed: Bool = false) {
        guard self.isEnabled else {
            self.tintColor = ChronusColor.lightGray
            return
        }
        
        switch theme {
        case .red:
            backgroundColor = isPressed ? ChronusColor.darkRed : ChronusColor.red
        case .green:
            backgroundColor = isPressed ? ChronusColor.darkGreen : ChronusColor.green
        case .blue:
            backgroundColor = isPressed ? ChronusColor.darkBlue : ChronusColor.blue
        case .black:
            backgroundColor = isPressed ? ChronusColor.primaryDarkGray : ChronusColor.primaryGray
        case .white:
            backgroundColor = isPressed ? ChronusColor.offWhite : ChronusColor.white
        }
    }
}
