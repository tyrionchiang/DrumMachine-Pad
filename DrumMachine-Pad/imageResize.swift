//
//  imageResize.swift
//  DrumMachine-Pad
//
//  Created by Chiang Chuan on 31/05/2017.
//  Copyright © 2017 Chiang Chuan. All rights reserved.
//

import UIKit

extension UIImage{
    func resizeImage(newSize: CGSize) -> UIImage {
        guard self.size != newSize else { return self }
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
