//
//  ScreenView.swift
//  ChronusDS_Example
//
//  Created by Julio on 25/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import ChronusDS

protocol ScreenViewDelegate: AnyObject {
    
}

final class ScreenView: UIView {
    
    private lazy var titleLabel: ChronusLabel = {
        let label = ChronusLabel()
        label.text = "Título"
        label.font = ChronusFont.h1
        return label
    }()
    
    private lazy var titleButton: ChronusRoundButton = {
        let button = ChronusRoundButton()
        button.theme = .blue
        button.setTitle("Botão", for: .normal)
        return button
    }()
    
    private lazy var bottomButton: ChronusBottomButton = {
        let button = ChronusBottomButton()
        button.theme = .blue
        button.setTitle("Botão", for: .normal)
        return button
    }()
    
    private lazy var iconButton: ChronusIconButton = {
        let button = ChronusIconButton(size: 40, padding: 6)
        button.theme = .white
        button.iconName = "bag"
        return button
    }()
    
    private lazy var textField: ChronusTextField = {
        let text = ChronusTextField()
        text.textLabel = "Nome do label"
        return text
    }()
    
    weak var delegate: ScreenViewDelegate?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewCode()
    }
}

extension ScreenView: ViewCodeProtocol {
    
    func addHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(titleButton)
        self.addSubview(iconButton)
        self.addSubview(textField)
        self.addSubview(bottomButton)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        titleButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        iconButton.snp.makeConstraints { make in
            make.top.equalTo(titleButton.snp.bottom).inset(-20)
            make.leading.equalToSuperview().inset(10)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(iconButton.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview().inset(10)
        }
        
        bottomButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func setupViews() {
        self.backgroundColor = .white
    }
}
