//
//  UIEditButton.swift
//  DrumMachine-Pad
//
//  Created by Chiang Chuan on 19/05/2017.
//  Copyright © 2017 Chiang Chuan. All rights reserved.
//

import UIKit


let pi = CGFloat.pi


class UIDrumButton : UIButton{
    
    enum DrumState {
        case playing
        case stop
    }
    var drumState = DrumState.stop
    
    
    var volume : Float = defaultValue.valume{
        didSet{
           setNeedsDisplay()
        }
    }
    var backColor = UIColor.black{
        didSet{
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("Bass Drum", for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont(name: "Ikaros-Regular", size: 24)
//        self.backgroundColor = UIColor.cyan
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        
        let lineWidth : CGFloat = frame.width * 0.03
        let center = CGPoint(x: frame.width / 2, y: frame.height / 2)
        let length = frame.height -  lineWidth
        let corner = frame.width / 5
        
        drawCornerSquare(center: center, height: frame.height - lineWidth * 2, width: frame.width - lineWidth * 2, corner: corner - lineWidth / 2, color: backColor, lineWidth: 0)
        if AppState.current == .volume {
            drawVolume(bottom: CGPoint(x: center.x, y: frame.height - lineWidth / 2), length : length , height: CGFloat(volume) * (frame.height -  lineWidth), width: frame.width - lineWidth , corner: corner, color: UIColor.appStyleColor.orange)
        }
        
        drawCornerSquare(center: center, height: frame.height - lineWidth, width: frame.width - lineWidth, corner: corner, color: UIColor.appStyleColor.green, lineWidth: lineWidth)

    }
}
fileprivate func drawVolume(bottom: CGPoint, length : CGFloat, height: CGFloat, width: CGFloat, corner: CGFloat, color: UIColor){
    
    let line = UIBezierPath()
    
    let p0 = CGPoint(x: bottom.x - width / 2 + corner, y: bottom.y)
    let rc1 = CGPoint(x: p0.x, y: p0.y - corner) //Arc Center
    let rc2 = CGPoint(x: bottom.x + width / 2 - corner, y: rc1.y)

    if height != 0{
        
        line.move(to: p0)
        
        if height > (length - corner){
            
            let degree = asin(( height - length + corner ) / corner)
            let topRc1 = CGPoint(x: rc1.x, y: p0.y - length + corner)
            let topRc2 = CGPoint(x: rc2.x, y: p0.y - length + corner)
            
            line.addArc(withCenter: rc1, radius: corner, startAngle: pi / 2, endAngle: pi, clockwise: true)

            line.addArc(withCenter: topRc1, radius: corner, startAngle: pi, endAngle: pi + degree, clockwise: true)
            
            line.addArc(withCenter: topRc2, radius: corner, startAngle: pi * 2 - degree, endAngle: pi * 2, clockwise: true)
            
            line.addArc(withCenter: rc2, radius: corner, startAngle: 0, endAngle: pi / 2, clockwise: true)
            
        }else if height > corner{
            
            line.addArc(withCenter: rc1, radius: corner, startAngle: pi / 2, endAngle: pi, clockwise: true)
            
            line.addLine(to: CGPoint(x: bottom.x - width / 2, y: length - height))
            line.addLine(to: CGPoint(x: bottom.x + width / 2, y: length - height))
            
            line.addArc(withCenter: rc2, radius: corner, startAngle: 0, endAngle: pi / 2, clockwise: true)
            
        }else{
            
            let degree = acos((corner - height) / corner)
            line.addArc(withCenter: rc1, radius: corner, startAngle: pi / 2, endAngle: degree + pi / 2, clockwise: true)
            
            line.addArc(withCenter: rc2, radius: corner, startAngle: pi / 2 - degree, endAngle: pi / 2, clockwise: true)
        }
        line.close()
        color.set()
        line.fill()

    }

}

fileprivate func drawCornerSquare(center: CGPoint, height: CGFloat, width: CGFloat, corner: CGFloat, color: UIColor, lineWidth: CGFloat){
    let line = UIBezierPath()
    
    line.move(to: CGPoint(x: center.x - width / 2, y: center.y))
    line.addArc(withCenter: CGPoint(x: center.x - width / 2 + corner, y: center.y - height / 2 + corner), radius: corner, startAngle: pi, endAngle: pi * 3 / 2, clockwise: true)
    line.addArc(withCenter: CGPoint(x: center.x + width / 2 - corner, y: center.y - height / 2 + corner), radius: corner, startAngle: pi * 3 / 2, endAngle: pi * 2, clockwise: true)
    line.addArc(withCenter: CGPoint(x: center.x + width / 2 - corner, y: center.y + height / 2 - corner), radius: corner, startAngle: pi * 0, endAngle: pi * 1 / 2, clockwise: true)
    line.addArc(withCenter: CGPoint(x: center.x - width / 2 + corner, y: center.y + height / 2 - corner), radius: corner, startAngle: pi * 1 / 2, endAngle: pi, clockwise: true)
    line.close()
    
    color.set()
    if lineWidth != 0 {
        line.lineWidth = lineWidth
        line.stroke()
    }else{
        line.fill()
    }
    
}


class UINoteButton : UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.masksToBounds = true
//        self.layer.cornerRadius = frame.width / 2
        self.backgroundColor = UIColor.appStyleColor.elements
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





class UIEditButton: UIButton {
    
    var drawColor = UIColor.appStyleColor.elements
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("Edit", for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentVerticalAlignment = .bottom
        self.titleLabel?.font = UIFont(name: "Ikaros-Regular", size: 18)
//        self.titleEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        for i in 0...15{
            let arcWidth = frame.width / 4 * 0.85
            let toCenterX = (frame.width - arcWidth * 4) / 2
            drawArc(CGPoint(x: arcWidth * CGFloat(i % 4) + arcWidth / 2 + toCenterX, y: arcWidth * CGFloat(i / 4) + arcWidth / 2 ) , radius: arcWidth / 2 - 1, startAngle: 0.0, endAngle: pi * 2 ,arcColor: drawColor , lineWidth: 0)
        }
    }
}


class UIBPMButton: UIButton {
    
    var drawColor = UIColor.appStyleColor.elements
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("BPM", for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentVerticalAlignment = .bottom
        self.titleLabel?.font = UIFont(name: "Ikaros-Regular", size: 18)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        drawArc( CGPoint(x: frame.width / 2, y: frame.width / 2 - 5), radius: frame.width / 6, startAngle: 0.0, endAngle: 2 * pi, arcColor: drawColor, lineWidth: 0)
        drawArc(CGPoint(x: frame.width / 2, y: frame.width / 2 - 5), radius: frame.width / 3, startAngle: 0.0, endAngle: 2 * pi, arcColor: drawColor, lineWidth: frame.width / 5)
    }
}







class UIRecordButton: UIButton {
    
    var recordCorner : CGFloat = 0.0
    var recordLength : CGFloat = 0.0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func update(corner : CGFloat, length : CGFloat){
        recordCorner = corner
        recordLength = length
        setNeedsDisplay()
    }

    
    override func draw(_ rect: CGRect) {
        
        let r = min(frame.width, frame.height) / 2
        let lineWidth = r * 0.15
        
        if recordCorner == 0 && recordLength == 0 {
            update(corner: r , length: r * 2)
        }
        
        drawCornerSquare(center: CGPoint(x: frame.width / 2, y: frame.height / 2), height: recordLength -  lineWidth * 2, width: recordLength -  lineWidth * 2, corner: (recordCorner - lineWidth), color: UIColor(r: 232, g: 40, b: 40), lineWidth: 0)
        
        drawArc(CGPoint(x: frame.width / 2, y: frame.height / 2), radius: r - lineWidth / 2, startAngle: 0.0, endAngle: 2 * pi, arcColor: UIColor.appStyleColor.elements, lineWidth: lineWidth)
    }
}


class UIVolumeButton: UIButton {
    
    var drawColor = UIColor.appStyleColor.elements
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("Volume", for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentVerticalAlignment = .bottom
        self.titleLabel?.font = UIFont(name: "Ikaros-Regular", size: 18)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        for i in 1...6 {
            let sqWidth = frame.width / 7
        
            if i < 4{
                drawSquare(botton: CGPoint(x: sqWidth * CGFloat(i), y:  frame.height * 4 / 6), width: sqWidth - 3, height: frame.height * 2 / 6 , corner: 2, color: drawColor, lineWidth: 0)
            }else{
                drawSquare(botton: CGPoint(x: sqWidth * CGFloat(i), y:  frame.height * 4 / 6), width: sqWidth - 3, height: frame.height / 10 * CGFloat(i) , corner: 2, color: drawColor, lineWidth: 0)
            }
        }
        
    }

}

fileprivate func drawArc(_ center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, arcColor: UIColor , lineWidth: CGFloat){
    
    let arcWiddth = radius
    let Path = UIBezierPath(arcCenter: center, radius: arcWiddth, startAngle: startAngle, endAngle: endAngle, clockwise: true)
    arcColor.set()
    
    if lineWidth != 0{
        Path.lineWidth = lineWidth
        Path.stroke()
    }else{
        Path.fill()
    }
}

fileprivate func drawSquare(botton: CGPoint, width: CGFloat, height: CGFloat, corner: CGFloat, color: UIColor, lineWidth: CGFloat){
    let line = UIBezierPath()
    let LTPoint = CGPoint(x: botton.x - width / 2 + corner, y: botton.y - height + corner)
    let RTPoint = CGPoint(x: LTPoint.x + width - corner * 2, y: LTPoint.y)
    let RBPoint = CGPoint(x: RTPoint.x, y: RTPoint.y + height - corner * 2)
    let LBPoint = CGPoint(x: LTPoint.x, y: RBPoint.y)
    line.move(to: CGPoint(x: LTPoint.x - corner , y: LTPoint.y))
    line.addArc(withCenter: LTPoint, radius: corner, startAngle: pi , endAngle: pi * 3/2, clockwise: true)
    line.addArc(withCenter: RTPoint, radius: corner, startAngle: pi * 3 / 2, endAngle: pi * 2, clockwise: true)
    line.addArc(withCenter: RBPoint, radius: corner, startAngle: 0.0 , endAngle: pi / 2, clockwise: true)
    line.addArc(withCenter: LBPoint, radius: corner, startAngle: pi / 2 , endAngle: pi, clockwise: true)
    line.close()
    color.set()
    if lineWidth != 0 {
        line.lineWidth = lineWidth
        line.stroke()
    }else{
        line.fill()
    }

}



