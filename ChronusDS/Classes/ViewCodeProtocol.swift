//
//  ViewCodeProtocol.swift
//  ChronusDS
//
//  Created by Julio on 18/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation

public protocol ViewCodeProtocol {
    func addHierarchy()
    func setupConstraints()
    func setupViews()
}

extension ViewCodeProtocol {
    public func setupViewCode() {
        addHierarchy()
        setupConstraints()
        setupViews()
    }
}
