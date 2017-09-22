//
//  CustomUIView.swift
//  DrumMachine-Pad
//
//  Created by Chiang Chuan on 03/06/2017.
//  Copyright © 2017 Chiang Chuan. All rights reserved.
//

import UIKit


class UIBPMButtonContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.zPosition = 100
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    
    override func draw(_ rect: CGRect) {
        
        let arcWiddth = min(frame.width, frame.height) * 0.29
        let Path = UIBezierPath(arcCenter: CGPoint(x: frame.width / 2 , y: frame.height / 2), radius: arcWiddth, startAngle: CGFloat.pi / 2, endAngle: CGFloat.pi * 5 / 2, clockwise: true)
        UIColor.appStyleColor.elements.set()
        Path.fill()
    }
}

class UIBPMPlusMinusButton : UIButton{
    
    var drawColor = UIColor.appStyleColor.elements{
        didSet{
            setNeedsDisplay()
        }
    }

    var style = true{
        didSet{
           setNeedsDisplay()
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let radius1 = frame.width / 2
        let radius2 = frame.width * 0.325
        
        let degree1 = CGFloat.pi * 0.02
        
        if style{
            let x1 = center.x - radius1 * cos(degree1)
            let y1 = frame.height - radius1 * sin(degree1)
            
            let y2 = y1
            let degree2 = asin( ( frame.height - y2 ) / radius2 )
            
            path.move(to: CGPoint(x: x1, y: y1))
            path.addArc(withCenter: CGPoint(x: frame.width / 2, y: frame.height), radius: radius1, startAngle: CGFloat.pi + degree1, endAngle: CGFloat.pi * 2 - degree1, clockwise: true)
            
            path.addArc(withCenter: CGPoint(x: frame.width / 2, y: frame.height), radius: radius2, startAngle: CGFloat.pi * 2 - degree2, endAngle: CGFloat.pi + degree2, clockwise: false)
            
            path.close()
            drawColor.set()
            path.fill()
            
            
            let plus = UIBezierPath()
            let plusCenter = CGPoint(x: frame.width / 2, y: (radius1 - radius2) / 2)
            let length : CGFloat = frame.height / 10
            
            let p1 = CGPoint(x: plusCenter.x - length * 3 / 4, y: plusCenter.y + length / 4)
            let p2 = CGPoint(x: p1.x, y: p1.y - length / 2)
            let p3 = CGPoint(x: p2.x + length / 2, y: p2.y)
            let p4 = CGPoint(x: p3.x, y: p3.y - length / 2)
            let p5 = CGPoint(x: p3.x + length / 2, y: p3.y - length / 2)
            
            plus.move(to: p1)
            plus.addLine(to: p2)
            plus.addLine(to: p3)
            plus.addLine(to: p4)
            plus.addLine(to: p5)
            plus.addLine(to: CGPoint(x: p5.x, y: p3.y))
            plus.addLine(to: CGPoint(x: plusCenter.x * 2 - p2.x, y: p3.y))
            plus.addLine(to: CGPoint(x: plusCenter.x * 2 - p2.x, y: p1.y))
            plus.addLine(to: CGPoint(x: p5.x, y: p1.y))
            plus.addLine(to: CGPoint(x: p5.x, y: plusCenter.y * 2 - p5.y))
            plus.addLine(to: CGPoint(x: p4.x, y: plusCenter.y * 2 - p5.y))
            plus.addLine(to: CGPoint(x: p4.x, y: p1.y))
            
            UIColor.black.set()
            plus.fill()
 
        }else{
            let x1 = center.x - radius1 * cos(degree1)
            let y1 = radius1 * sin(degree1)
            
            let y2 = y1
            let degree2 = asin( y2 / radius2 )
            
            path.move(to: CGPoint(x: x1, y: y1))
            path.addArc(withCenter: CGPoint(x: frame.width / 2, y: 0.0), radius: radius1, startAngle: CGFloat.pi - degree1, endAngle: degree1, clockwise: false)
            
            path.addArc(withCenter: CGPoint(x: frame.width / 2, y: 0.0), radius: radius2, startAngle: degree2, endAngle: CGFloat.pi - degree2, clockwise: true)
            
            path.close()
            drawColor.set()
            path.fill()
            
            
            let plus = UIBezierPath()
            let plusCenter = CGPoint(x: frame.width / 2, y: radius2 + (radius1 - radius2) / 2)
            let length : CGFloat = frame.height / 10
            
            let p1 = CGPoint(x: plusCenter.x - length * 3 / 4, y: plusCenter.y + length / 4)
            let p2 = CGPoint(x: p1.x, y: p1.y - length / 2)
            let p3 = CGPoint(x: p2.x + length * 3 / 2, y: p2.y)
            let p4 = CGPoint(x: p1.x + length * 3 / 2, y: p1.y)
            
            plus.move(to: p1)
            plus.addLine(to: p2)
            plus.addLine(to: p3)
            plus.addLine(to: p4)
            plus.close()
            
            UIColor.black.set()
            plus.fill()

        }
        
        
    }
}

class UIBPMMinusButton : UIButton{
    
    var drawColor = UIColor.appStyleColor.elements
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let radius1 = frame.width / 2
        let radius2 = frame.width * 0.325
        
        let degree1 = CGFloat.pi * 0.02
        
        let x1 = center.x - radius1 * cos(degree1)
        let y1 = radius1 * sin(degree1)
        
        let y2 = y1
        let degree2 = asin( y2 / radius2 )
        
        path.move(to: CGPoint(x: x1, y: y1))
        path.addArc(withCenter: CGPoint(x: frame.width / 2, y: 0.0), radius: radius1, startAngle: CGFloat.pi - degree1, endAngle: degree1, clockwise: false)
        
        path.addArc(withCenter: CGPoint(x: frame.width / 2, y: 0.0), radius: radius2, startAngle: degree2, endAngle: CGFloat.pi - degree2, clockwise: true)
        
        path.close()
        drawColor.set()
        path.fill()
        
        
        let plus = UIBezierPath()
        let plusCenter = CGPoint(x: frame.width / 2, y: radius2 + (radius1 - radius2) / 2)
        let length : CGFloat = frame.height / 10
        
        let p1 = CGPoint(x: plusCenter.x - length * 3 / 4, y: plusCenter.y + length / 4)
        let p2 = CGPoint(x: p1.x, y: p1.y - length / 2)
        let p3 = CGPoint(x: p2.x + length * 3 / 2, y: p2.y)
        let p4 = CGPoint(x: p1.x + length * 3 / 2, y: p1.y)
        
        plus.move(to: p1)
        plus.addLine(to: p2)
        plus.addLine(to: p3)
        plus.addLine(to: p4)
        plus.close()
        
        UIColor.black.set()
        plus.fill()
        
    }
}


