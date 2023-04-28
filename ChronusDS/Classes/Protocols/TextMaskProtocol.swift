//
//  TextMaskProtocol.swift
//  ChronusDS
//
//  Created by Julio on 27/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public protocol TextMaskProtocol {
    func maskedText(for text: String?) -> String?
}
