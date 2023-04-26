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
        
        bottomButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func setupViews() {
        self.backgroundColor = .white
    }
}
