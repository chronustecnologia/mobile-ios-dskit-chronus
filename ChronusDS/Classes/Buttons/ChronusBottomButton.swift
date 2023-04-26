//
//  ChronusBottomButton.swift
//  ChronusDS
//
//  Created by Julio on 25/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public class ChronusBottomButton: ChronusButton {
    
    override func setupMargins() {
        layer.masksToBounds = true
        titleLabel?.font = ChronusFont.body
        contentVerticalAlignment = .top
                
        contentEdgeInsets = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
    }
    
    override func setupConstraints() {
        let safeAreaHeight = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0
        self.snp.makeConstraints { make in
            make.height.equalTo(64 + safeAreaHeight).priority(.high)
            make.width.greaterThanOrEqualTo(100).priority(.high)
        }
    }
}
