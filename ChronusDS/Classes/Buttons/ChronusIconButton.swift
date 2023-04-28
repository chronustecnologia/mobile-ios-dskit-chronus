//
//  ChronusIconButton.swift
//  ChronusDS
//
//  Created by Julio on 25/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public class ChronusIconButton: UIButton, Themeable {
    
    private var _size: CGFloat = 40.0
    private var _padding: CGFloat = 8.0
    
    public override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                isHighlighted = false
            }
        }
    }
    
    public override var isEnabled: Bool {
        didSet {
            setTheme()
        }
    }
    
    public var theme: ChronusTheme = .white {
        didSet {
            self.tintColor = theme == .white ? ChronusColor.black : ChronusColor.white
            setTheme()
        }
    }
    
    public override var intrinsicContentSize: CGSize {
        return CGSize(width: _size, height: _size)
    }
    
    public var iconName: String? {
        didSet {
            setImage(ChronusImage.image(named: iconName ?? ""), for: .normal)
        }
    }
    
    public init(size: CGFloat, padding: CGFloat) {
        _size = size
        _padding = padding
        super.init(frame: .zero)
        setup()
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
        setupConstraints()
        setTheme()
        self.contentEdgeInsets = UIEdgeInsets(top: _padding, left: _padding, bottom: _padding, right: _padding)
        self.layer.cornerRadius = _size / 2
        
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
    
    func setupConstraints() {
        self.snp.makeConstraints { make in
            make.width.height.equalTo(_size)
        }
    }
}
