//
//  ChronusRoundButton.swift
//  ChronusDS
//
//  Created by Julio on 25/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public class ChronusRoundButton: ChronusButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStyle()
    }
    
    override func setStyle() {
        super.setStyle()
        layer.cornerRadius = 16
    }
    
}
