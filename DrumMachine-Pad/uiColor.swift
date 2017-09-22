//
//  extension.swift
//  chat
//
//  Created by Chiang Chuan on 26/11/2016.
//  Copyright © 2016 Chiang Chuan. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat){
        self.init(red : r / 255, green : g / 255, blue : b / 255, alpha : 1)
    }
    
    struct appStyleColor {
        static let dark = UIColor(r: 22, g: 22, b: 22)
        static let backgroundBlack = UIColor(r: 51, g: 51, b: 51)
        static let elements = UIColor(r: 216, g: 216, b: 216)
        static let separator = UIColor(r: 198, g: 198, b: 198)
        static let orange = UIColor(r: 212, g: 159, b: 72)
        static let green = UIColor(r: 57, g: 188, b: 119)

//        static let teal = UIColor(r: 0, g: 171, b: 169)
    }

}



