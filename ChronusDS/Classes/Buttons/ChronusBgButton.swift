//
//  ChronusBgButton.swift
//  ChronusDS
//
//  Created by Julio on 27/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public class ChronusBgButton: UIButton, Themeable {
    
    public var theme: ChronusTheme = .white {
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
        layer.cornerRadius = 16
        addTarget(self, action: #selector(didHoldDown), for: .touchDown)
        addTarget(self, action: #selector(didRelease), for: .touchUpInside)
        addTarget(self, action: #selector(didRelease), for: .touchDragExit)

        setTheme(false)
    }
    
    @objc func didHoldDown() {
       setTheme(true)
    }
    
    @objc func didRelease() {
        setTheme(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve, animations: {
                self.setTheme(false)
            }, completion: nil)
        }
    }
}
