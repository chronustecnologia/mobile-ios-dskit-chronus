//
//  ChronusFont.swift
//  ChronusDS
//
//  Created by Julio on 24/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public class ChronusFont: NSObject {
    
    public static let h1 = font(type: .regular, size: 32)
    public static let h1Highlight = font(type: .bold, size: 32)
    
    public static let h3 = font(type: .regular, size: 24)
    public static let h3Highlight = font(type: .bold, size: 24)
    
    public static let body = font(type: .regular, size: 18)
    public static let bodyHighlight = font(type: .bold, size: 18)
    
    public static let thin = font(type: .thin, size: 16)
    public static let thinHighlight = font(type: .bold, size: 16)
    
    public static let figurine = font(type: .regular, size: 16)
    
    public enum FontType: String {
        case thin = "Poppins-Thin"
        case light = "Poppins-Light"
        case regular = "Poppins-Regular"
        case bold = "Poppins-Bold"
        case black = "Poppins-Black"
    }
    
    public static func font(type: FontType, size: CGFloat) -> UIFont {
        return UIFont(name: type.rawValue, size: size) ?? UIFont()
    }
    
    static func loadFontWith(name: String, type: String = "ttf") {
        let frameworkBundle = Bundle(for: ChronusFont.self)
        if let pathForResourceString = frameworkBundle.path(forResource: name, ofType: type) {
            if let fontData = NSData(contentsOfFile: pathForResourceString) {
                if let dataProvider = CGDataProvider(data: fontData) {
                    let fontRef = CGFont(dataProvider)
                    var errorRef: Unmanaged<CFError>? = nil

                    if !CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) {
                        NSLog("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
                    }
                }
            }
        }
    }

    public static func loadFonts() {
        loadFontWith(name: FontType.thin.rawValue)
        loadFontWith(name: FontType.light.rawValue)
        loadFontWith(name: FontType.regular.rawValue)
        loadFontWith(name: FontType.bold.rawValue)
        loadFontWith(name: FontType.black.rawValue)
    }
}
