//
//  ViewCodeProtocol.swift
//  AppViewCode
//
//  Created by Julio on 18/04/23.
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
