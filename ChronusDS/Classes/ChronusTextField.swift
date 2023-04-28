//
//  ChronusTextField.swift
//  ChronusDS
//
//  Created by Julio on 27/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public class ChronusTextField: UITextField {

    open var textMask: TextMaskProtocol?
    
    public override var text: String? {
        didSet {
            guard text != oldValue else { return }
            applyMask()
        }
    }
    
    private lazy var figurineLabel: ChronusLabel = {
        let label = ChronusLabel()
        label.font = ChronusFont.figurine
        label.text = ""
        label.textAlignment = .left
        label.isAccessibilityElement = false
        return label
    }()
    
    public var descText: String = "" {
        didSet {
            figurineLabel.text = descText
            setupConstraints()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    public override func prepareForInterfaceBuilder() {
        setupLayout()
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
    }
    
    func setupLayout() {
        font = ChronusFont.font(type: .bold, size: 28)
        textColor = ChronusColor.blue
        textAlignment = .left
        contentVerticalAlignment = .top
        borderStyle = .none
        layer.masksToBounds = true
        addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)

        self.addSubview(figurineLabel)

        setupConstraints()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        applyMask()
        self.defaultTextAttributes.updateValue(-0.43,
            forKey: NSAttributedString.Key.kern)
    }
    
    func applyMask() {
        guard let textMask = textMask else { return }
        text = textMask.maskedText(for: text)
    }
    
    func setupConstraints() {
       let height = descText == "" ? 40 : 70
            
        self.snp.updateConstraints { update in
            update.height.equalTo(height)
        }
        
        self.snp.makeConstraints { make in
            make.width.greaterThanOrEqualTo(100)
        }
        
        figurineLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.top).inset(65)
        }
        
        layoutIfNeeded()
    }
}
