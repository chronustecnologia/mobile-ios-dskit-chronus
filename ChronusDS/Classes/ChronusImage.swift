//
//  ChronusImage.swift
//  ChronusDS
//
//  Created by Julio on 27/04/23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

public class ChronusImage: NSObject {

    public static func image(named name: String) -> UIImage? {
        return UIImage(named: name, in: Bundle(for: ChronusImage.self), compatibleWith: nil)
    }
}
