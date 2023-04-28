//
//  ChronusImageView.swift
//  ChronusDS
//
//  Created by Julio on 27/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

public class ChronusImageView: UIImageView {
    
    public convenience init(imageName: String) {
        self.init()
        self.image = ChronusImage.image(named: imageName)
    }
    
    @IBInspectable public var imageName: String? = nil {
        didSet {
            guard let name = imageName else {
                self.image = nil
                return
            }
            self.image = ChronusImage.image(named: name)
        }
    }
    
}
