//
//  ViewController+handlers.swift
//  DrumMachine-Pad
//
//  Created by Chiang Chuan on 22/05/2017.
//  Copyright © 2017 Chiang Chuan. All rights reserved.
//

import UIKit


extension ViewController {
    
    func addTarget() {
        editButton.addTarget(self, action: #selector(handleEditButton), for: .touchUpInside)
        volumeButton.addTarget(self, action: #selector(handleVolumeButton), for: .touchUpInside)
        BPMButton.addTarget(self, action: #selector(handleBPMButton), for: .touchUpInside)
        
        recordButton.addTarget(self, action: #selector(handleRecordButton), for: .touchUpInside)
        
        for i in 0 ..< noteButton.count{
            noteButton[i].addTarget(self, action: #selector(handleNoteButton), for: .touchUpInside)
        }
        for i in 0..<drumVolumeSlider.count{
            drumVolumeSlider[i].addTarget(self, action: #selector(handleDrumVolumeSlider), for: .valueChanged)
        }
        for i in 0..<drumButton.count {
            drumButton[i].addTarget(self, action: #selector(handleDrumButton), for: .touchUpInside)
            if i < drumSideButton.count{
                drumSideButton[i].addTarget(self, action: #selector(handleDrumButton), for: .touchUpInside)
            }
        }
        
        BPMContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleBPMBackgroundView)))
        
        BPMPlusButton.addTarget(self, action: #selector(handleBPMPlusMinusButton), for: .touchUpInside)
        BPMMinusButton.addTarget(self, action: #selector(handleBPMPlusMinusButton), for: .touchUpInside)
    }
    
    func handleBPMPlusMinusButton( sender : UIBPMPlusMinusButton ){
        sender.drawColor = UIColor.appStyleColor.backgroundBlack
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: false, block: { (Timer) in
            sender.drawColor = UIColor.appStyleColor.elements
        })
    }

    
    func handleDrumButton(sender : UIDrumButton) {
        print("click")
        if sender.drumState == .stop{
            sender.drumState = .playing
            sender.backColor = UIColor.appStyleColor.green
            sender.setTitleColor(UIColor.black, for: .normal)
        }else{
            sender.drumState = .stop
            sender.backColor = UIColor.black
            sender.setTitleColor(UIColor.white, for: .normal)
        }
    }
    
    func handleDrumVolumeSlider(sender : UIDrumVolumeSlider) {
        if sender.tag < drumButton.count{
            drumButton[sender.tag].volume = sender.value
        }else{
            let n = sender.tag - drumButton.count
            drumSideButton[n].volume = sender.value
        }
    }

    
    func handleNoteButton( sender : UINoteButton ){
        sender.backgroundColor = sender.backgroundColor == UIColor.appStyleColor.elements ? UIColor.appStyleColor.green : UIColor.appStyleColor.elements
    }
    
    
    func handleRecordButton() {
//        let r = min(recordButton.frame.width / 2, recordButton.frame.height / 2)
        timer.invalidate()
        if EdittingState.current == .recording{
            EdittingState.current = .non
//            recordButton.update(corner: r, length: r * 2)
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateRecordAnimat), userInfo: nil, repeats: true)

        }else{
            EdittingState.current = .recording
//            recordButton.update(corner: r / 3, length: r)
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateRecordAnimat), userInfo: nil, repeats: true)
        }
    }
    func updateRecordAnimat(){
        let r = min(recordButton.frame.width / 2, recordButton.frame.height / 2)
        let c = (r - r / 3) / 10
        let l = (2*r - r) / 10
        if EdittingState.current == .non{
            if recordButton.recordLength <= r * 2{
                recordButton.recordCorner += c
                recordButton.recordLength += l
                recordButton.setNeedsDisplay()
            }else{
                timer.invalidate()
                recordButton.recordCorner = r
                recordButton.recordLength = r * 2
                recordButton.setNeedsDisplay()
            }
        }else{
            if recordButton.recordLength >= r{
                recordButton.recordCorner -= c
                recordButton.recordLength -= l
                recordButton.setNeedsDisplay()
            }else{
                timer.invalidate()
                recordButton.recordCorner = r / 3
                recordButton.recordLength = r
                recordButton.setNeedsDisplay()
            }
        }
    }
    
    
    func handleEditButton() {
        leavePage()
        AppState.current = AppState.current == .editting ? .menu : .editting
        print(AppState.current)
        appStateUpdate()
    }
    func handleVolumeButton() {
        leavePage()
        AppState.current = AppState.current == .volume ? .menu : .volume
        print(AppState.current)
        appStateUpdate()
    }
    func handleBPMButton() {
//        leavePage()
        if AppState.last == .non{
            AppState.last = AppState.current
            AppState.current = .BPM
            print(AppState.current)
            appStateUpdate()
        }
    }
    func handleBPMBackgroundView() {
        leavePage()
        AppState.current = AppState.last
        print(AppState.current)
        AppState.last = .non
    }

    
    func leavePage() {
        switch AppState.current {
        case .editting:
            editerViewShowHide(.hide)
            return
        case .BPM:
            BPMViewShowHide(.hide)
            return
        case .volume:
            valumeViewShowHiden(.hide)
            return
        case .menu:
            return
        default: return
        }
    }
    
    func appStateUpdate(){
        
        switch AppState.current {
        case .editting:
            editerViewShowHide(.show)
            return
        case .BPM:
            BPMViewShowHide(.show)
            return
        case .volume:
            valumeViewShowHiden(.show)
            return
        case .menu:
            return
        default: return
        }
        
    }
    
    enum showHide {
        case show
        case hide
    }
    
    func BPMViewShowHide(_ isShow : showHide) {
        
        let color = isShow == .show ? UIColor.appStyleColor.orange : UIColor.appStyleColor.elements
        BPMButton.drawColor = color
        BPMButton.setTitleColor(color, for: .normal)
        BPMButton.setNeedsDisplay()
        
        self.BPMContainerView.isHidden = isShow == .hide ? true : false

        BPMViewAnimate(isShow)
        
    }
    func BPMViewAnimate(_ isShow : showHide) {
    }
    
    
    func valumeViewShowHiden(_ isShow : showHide){
        let color = isShow == .show ? UIColor.appStyleColor.orange : UIColor.appStyleColor.elements
        volumeButton.drawColor = color
        volumeButton.setTitleColor(color, for: .normal)
        volumeButton.setNeedsDisplay()
        
        valumeViewAnimate(isShow)
        
        drumVolumeSliderHiden(isShow == .hide)
        drumButtonSetNeedsDisplay()
    }
    
    func valumeViewAnimate(_ isShow : showHide) {
        if isShow == .show {
            drumContainerViewHeightAnchor?.constant = view.frame.height * 0.15
            drumButtonContainerViewHeightAnchor?.constant = (drumContainerViewHeightAnchor?.constant)!
            
            drumButtonWidthAnchor?.isActive = false
            drumButtonWidthAnchor = drumButton[0].widthAnchor.constraint(equalToConstant: drumButtonWidth)
            drumButtonWidthAnchor?.isActive = true
            
            for i in 1..<drumButtonTopAnchor.count {
                drumButtonTopAnchor[i]?.constant = view.frame.height * 0.95 * 0.35  * CGFloat(i/3)
            }
        }else{
            drumButtonWidthAnchor?.isActive = false
            drumButtonWidthAnchor = drumButton[0].widthAnchor.constraint(equalTo: drumButton[0].heightAnchor)
            drumButtonWidthAnchor?.isActive = true
            
            
            drumContainerViewHeightAnchor?.constant = 0.0
            drumButtonContainerViewHeightAnchor?.constant = 0.0
            
            for i in 1..<drumButtonTopAnchor.count {
                drumButtonTopAnchor[i]?.constant = view.frame.height * 0.8 * 0.35 * CGFloat(i/3)
            }
        }
        UIView.animate(withDuration: 0.1, animations: {
            self.view.layoutIfNeeded()
        })

    }
    
    func drumVolumeSliderHiden(_ bool: Bool) {
        for i in 0..<drumVolumeSlider.count{
            drumVolumeSlider[i].isHidden = bool
        }
    }
    func drumButtonSetNeedsDisplay() {
        for i in 0..<drumButton.count {
            drumButton[i].setNeedsDisplay()
            if i < 3 {
                drumSideButton[i].setNeedsDisplay()
            }
        }
    }
    
    func editerViewShowHide(_ isShow : showHide){
        let color = isShow == .show ? UIColor.appStyleColor.orange : UIColor.appStyleColor.elements
        editButton.drawColor = color
        editButton.setTitleColor(color, for: .normal)
        editButton.setNeedsDisplay()
        
        editerViewAnimate(isShow)
    }
    func editerViewAnimate(_ isShow : showHide){
        if isShow == .show {
            beatGrooveEditerViewWidthAnchor?.constant = view.frame.width * 0.3
            
            drumContainerViewHeightAnchor?.constant = view.frame.height * 0.17
            drumButtonContainerViewHeightAnchor?.constant = view.frame.height * -0.08
            for i in 1..<drumButtonLeftAnchor.count {
                drumButtonLeftAnchor[i]?.constant = view.frame.height * 0.72 * 0.35  * CGFloat(i%3)
                drumButtonTopAnchor[i]?.constant = view.frame.height * 0.72 * 0.35  * CGFloat(i/3)
            }
        }else{
            beatGrooveEditerViewWidthAnchor?.constant = 0.0
            
            drumContainerViewHeightAnchor?.constant = 0.0
            drumButtonContainerViewHeightAnchor?.constant = 0.0
            for i in 1..<drumButtonLeftAnchor.count {
                drumButtonLeftAnchor[i]?.constant = view.frame.height * 0.8 * 0.35 * CGFloat(i%3)
                drumButtonTopAnchor[i]?.constant = view.frame.height * 0.8 * 0.35 * CGFloat(i/3)
            }
        }
        
        UIView.animate(withDuration: 0.26, animations: {
            self.view.layoutIfNeeded()
        })
        drumSideButtonAnimate(isShow)
        
    }
    
    func drumSideButtonAnimate(_ isShow : showHide){
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = customPath().cgPath
        animation.duration = 0.26
        animation.timingFunctions?[0] = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        drumSideButtonContainerView.layer.add(animation, forKey: nil)
        
        if(isShow == .show){
            for i in 0..<drumSideButtonBottomAnchor.count{
                drumSideButtonBottomAnchor[i]?.isActive = false
                drumSideButtonBottomAnchor[i] = drumSideButton[i].bottomAnchor.constraint(equalTo: drumSideButtonContainerView.bottomAnchor)
                drumSideButtonBottomAnchor[i]?.isActive = true
                
                drumSideButtonRightAnchor[i]?.isActive = false
                drumSideButtonRightAnchor[i] = drumSideButton[i].rightAnchor.constraint(equalTo: drumButton[i].rightAnchor)
                drumSideButtonRightAnchor[i]?.isActive = true
            }
        }else{
            for i in 0..<drumSideButtonBottomAnchor.count{
                drumSideButtonBottomAnchor[i]?.isActive = false
                drumSideButtonBottomAnchor[i] = drumSideButton[i].bottomAnchor.constraint(equalTo: drumButton[3*i].bottomAnchor)
                drumSideButtonBottomAnchor[i]?.isActive = true
                
                drumSideButtonRightAnchor[i]?.isActive = false
                drumSideButtonRightAnchor[i] = drumSideButton[i].rightAnchor.constraint(equalTo: drumSideButtonContainerView.rightAnchor)
                drumSideButtonRightAnchor[i]?.isActive = true
            }
        }
    }
    
    func customPath() -> UIBezierPath {
        let path = UIBezierPath()
        
        let point = CGPoint(x: drumSideButtonContainerView.frame.midX, y: drumSideButtonContainerView.frame.midY)
        
        path.move(to: point)
        
        path.addLine(to: CGPoint(x: point.x + 1000, y: point.y))
        
        path.addLine(to: point)
        
        return path
        
    }
    
    
}
