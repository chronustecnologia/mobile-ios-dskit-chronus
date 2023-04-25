//
//  ChronusButton.swift
//  ChronusDS
//
//  Created by Julio on 24/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import SnapKit

public class ChronusButton: UIButton, Themeable {
    
    public var theme: ChronusTheme = .blue {
        didSet {
            setTheme()
        }
    }
    
    public override var isHighlighted: Bool {
        didSet { if isHighlighted { isHighlighted = false } }
    }
    
    public override var isEnabled: Bool {
        didSet {
            setTheme()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        setStyle()
        setupConstraints()
        setTheme()
        self.addTarget(self, action: #selector(didHoldDown), for: .touchDown)
        self.addTarget(self, action: #selector(didRelease), for: .touchUpInside)

    }
    
    @objc func didHoldDown() {
        setTheme(true)
    }
    
    @objc func didRelease() {
        setTheme(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve, animations: {
                self.setTheme()
            }, completion: nil)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupMargins()
    }

    func setupMargins() {
        contentEdgeInsets = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
    }
    
    func setStyle() {
        layer.masksToBounds = true
        titleLabel?.font = ChronusFont.body
        setupMargins()
    }
    
    func setupConstraints() {
        self.snp.makeConstraints { make in
            make.height.equalTo(64).priority(.high)
            make.width.greaterThanOrEqualTo(100).priority(.high)
        }
    }
}
