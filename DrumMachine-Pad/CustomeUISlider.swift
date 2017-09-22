//
//  CustomeUISlider.swift
//  DrumMachine-Pad
//
//  Created by Chiang Chuan on 26/05/2017.
//  Copyright © 2017 Chiang Chuan. All rights reserved.
//

import UIKit

class UIEditViewVolumeSlider: UISlider {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.value = defaultValue.valume
        self.setThumbImage(UIImage(), for: .normal)
        self.setMaximumTrackImage(UIImage(named: "maxTrackImg"), for: .normal)
        self.setMinimumTrackImage(UIImage(named: "minTrackImg"), for: .normal)
//        self.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi * 3 / 2)
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class UIDrumVolumeSlider : UISlider{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.value = defaultValue.valume
//        self.thumbTintColor = UIColor.cyan        
//        self.setThumbImage(UIImage(), for: .normal)

//        self.setMaximumTrackImage(#imageLiteral(resourceName: "maxTrackImg"), for: .normal)
//        self.setMinimumTrackImage(#imageLiteral(resourceName: "minTrackImg"), for: .normal)
        self.maximumTrackTintColor = UIColor.clear
        self.minimumTrackTintColor = UIColor.clear
        self.maximumValueImageRect(forBounds: CGRect.null)
        self.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi * 3 / 2)
//        self.backgroundColor = UIColor.blue
//        self.alpha = 0.8
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: frame.width * 0.03, y: 0, width: frame.height - frame.width * 0.06, height: frame.width)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


