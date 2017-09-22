//
//  waveView.swift
//  SiriWaveViewTest
//
//  Created by Chiang Chuan on 23/04/2017.
//  Copyright © 2017 Chiang Chuan. All rights reserved.
//

import UIKit

struct dp { //default Parameter
    static let kDefaultPhase              : CGFloat = 0.0
    static let kDefaultFrequency          : CGFloat = 1.5
    static let kDefaultAmplitude          : CGFloat = 1.0
    static let kDefaultIdleAmplitude      : CGFloat = 0.01
    static let kDefaultNumberOfWaves      : Int = 5
    static let kDefaultPhaseShift         : CGFloat = -0.15
    static let kDefaultDensity            : CGFloat = 5.0
    static let kDefaultPrimaryLineWidth   : CGFloat = 3.0
    static let kDefaultSecondaryLineWidth : CGFloat = 1.0
}



class UIWaveView: UIView {
    
    var phase =                     dp.kDefaultPhase
    var amplitude =                 dp.kDefaultAmplitude

    var numberOfWaves =             dp.kDefaultNumberOfWaves
    var waveColor =                 UIColor.white
    var primaryWaveLineWidth =      dp.kDefaultPrimaryLineWidth
    var secondaryWaveLineWidth =    dp.kDefaultSecondaryLineWidth
    var idleAmplitude =             dp.kDefaultAmplitude
    var frequency =                 dp.kDefaultFrequency
    var density =                   dp.kDefaultDensity
    var phaseShift =                dp.kDefaultPhaseShift
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    func setup(){
        
        frequency = dp.kDefaultFrequency
        
        amplitude = dp.kDefaultAmplitude
        idleAmplitude = dp.kDefaultIdleAmplitude
        
        numberOfWaves = dp.kDefaultNumberOfWaves
        phaseShift = dp.kDefaultPhaseShift
        density = dp.kDefaultDensity
    
        primaryWaveLineWidth = dp.kDefaultPrimaryLineWidth
        secondaryWaveLineWidth = dp.kDefaultSecondaryLineWidth
        
    }

    func updateWithLevel(level : CGFloat){
        
        phase += phaseShift
        amplitude = fmax(level, idleAmplitude)
        setNeedsDisplay()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {

        let context = UIGraphicsGetCurrentContext()
        context?.clear(rect)
        
        backgroundColor?.set()
        
        context?.fill(rect)
        
        for i in 0 ..< numberOfWaves {
            
            let n = CGFloat(numberOfWaves)
            
            let context = UIGraphicsGetCurrentContext()
            let strokeLineWidth = i == 0 ? primaryWaveLineWidth : secondaryWaveLineWidth
            context?.setLineWidth(strokeLineWidth)
            
            let halfHeight : CGFloat = self.bounds.height / 2.0
            let width = self.bounds.width
            let mid = width / 2.0
            
            let maxAmplitude : CGFloat = halfHeight - (strokeLineWidth * 2)
            
            let progress =  1.0 - CGFloat(i) / n
            let normedAmplitude : CGFloat = amplitude * (1.5 * progress - (2.0 / n))
            
            let multiplier = min(1.0, (progress / 3.0 * 2.0) + (1.0 / 3.0))
            
            
            waveColor.withAlphaComponent(waveColor.cgColor.alpha * multiplier).set()
            
            var x : CGFloat = 0.0
            while x < width + density {
                
                let scaling : CGFloat = -pow(1.0 / mid * (x - mid), 2.0) + 1.0
                let pi = CGFloat.pi
                let y = scaling * maxAmplitude * normedAmplitude * CGFloat(sinf(Float(2.0 * pi * x / width * frequency + phase))) + halfHeight
                
                if (x == 0) {
                    context?.move(to: CGPoint(x: x, y: y))
                } else {
                    context?.addLine(to: CGPoint(x: x, y: y))
                }

                x += density
            }
            
            context?.strokePath()
            
        }
    
    
    }
 

}
