//
//  ChronusProgressView.swift
//  ChronusDS
//
//  Created by Julio on 27/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import SnapKit

public class PanProgressView: UIProgressView {
    
    public var isPositive: Bool = false {
        didSet {
            self.progressTintColor = isPositive ? ChronusColor.blue : ChronusColor.red
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        self.progressViewStyle = .bar
        self.trackTintColor = ChronusColor.white
        self.progressTintColor = isPositive ? ChronusColor.blue : ChronusColor.red
        
        setupConstraints()
    }
    
    func setupConstraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(4)
        }
    }
}
