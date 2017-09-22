//
//  ViewController+SetView.swift
//  DrumMachine-Pad
//
//  Created by Chiang Chuan on 03/05/2017.
//  Copyright © 2017 Chiang Chuan. All rights reserved.
//

import UIKit

class basicUIView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}

class UIAlignBottomLabel : UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = "Volume"
        self.textColor = UIColor.appStyleColor.elements
        self.font = UIFont(name: "Ikaros-Regular", size: 18)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let height = self.sizeThatFits(rect.size).height
        let y = rect.origin.y + rect.height - height
        super.drawText(in: CGRect(x: rect.origin.x, y: y, width: rect.width, height: height))
    }
}



extension ViewController{
    
    func setView() {
        print("setView")
//        view.backgroundColor = UIColor.appStyleColor.backgroundBlack
        
        setupTapBar()
        setupBeatGrooveEditerView()
        setupDrumView()
        setupBPMView()
        
    }
    
    func setupTapBar() {
        tapBarView.backgroundColor = UIColor.appStyleColor.dark
        tapBarSeparatorView.backgroundColor = UIColor.appStyleColor.separator
        
        tapBarView.layer.zPosition = 10
        
        
        view.addSubview(tapBarView)
        
        
        // need x, y, w, h
        tapBarView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tapBarView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tapBarView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.093).isActive = true
        tapBarView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        
        
        tapBarView.addSubview(tapBarSeparatorView)
        
        tapBarSeparatorView.leftAnchor.constraint(equalTo: tapBarView.leftAnchor).isActive = true
        tapBarSeparatorView.centerYAnchor.constraint(equalTo: tapBarView.centerYAnchor).isActive = true
        tapBarSeparatorView.widthAnchor.constraint(equalToConstant: 0.5).isActive = true
        tapBarSeparatorView.heightAnchor.constraint(equalTo: tapBarView.heightAnchor, multiplier: 0.995).isActive = true
        
        
        
        
        tapBarView.addSubview(editButton)
        tapBarView.addSubview(BPMButton)
        tapBarView.addSubview(volumeButton)
        
        editButton.centerXAnchor.constraint(equalTo: tapBarView.centerXAnchor).isActive = true
        editButton.bottomAnchor.constraint(equalTo: tapBarView.bottomAnchor, constant:  view.frame.height / -35).isActive = true
        editButton.widthAnchor.constraint(equalTo: tapBarView.widthAnchor, multiplier: 0.8).isActive = true
        editButton.heightAnchor.constraint(equalTo: editButton.widthAnchor, multiplier: 1.2).isActive = true
        
        BPMButton.centerXAnchor.constraint(equalTo: tapBarView.centerXAnchor).isActive = true
        BPMButton.bottomAnchor.constraint(equalTo: editButton.topAnchor, constant: view.frame.height / -35).isActive = true
        BPMButton.widthAnchor.constraint(equalTo: editButton.widthAnchor).isActive = true
        BPMButton.heightAnchor.constraint(equalTo: editButton.heightAnchor).isActive = true
        
        volumeButton.centerXAnchor.constraint(equalTo: tapBarView.centerXAnchor).isActive = true
        volumeButton.bottomAnchor.constraint(equalTo: BPMButton.topAnchor, constant: view.frame.height / -25).isActive = true
        volumeButton.widthAnchor.constraint(equalTo: editButton.widthAnchor).isActive = true
        volumeButton.heightAnchor.constraint(equalTo: editButton.widthAnchor).isActive = true
        
        
    }
    
    func setupBeatGrooveEditerView(){
        
        beatGrooveEditerView.backgroundColor = UIColor.appStyleColor.dark
        beatGrooveEditerSeparatorView.backgroundColor = UIColor.appStyleColor.separator
        
        view.addSubview(beatGrooveEditerView)
        view.addSubview(beatGrooveEditerSeparatorView)

        
        beatGrooveEditerView.rightAnchor.constraint(equalTo: tapBarView.leftAnchor).isActive = true
        beatGrooveEditerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        beatGrooveEditerViewWidthAnchor = beatGrooveEditerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0)
        beatGrooveEditerViewWidthAnchor?.isActive = true
        beatGrooveEditerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        
        beatGrooveEditerSeparatorView.rightAnchor.constraint(equalTo: beatGrooveEditerView.leftAnchor).isActive = true
        beatGrooveEditerSeparatorView.centerYAnchor.constraint(equalTo: beatGrooveEditerView.centerYAnchor).isActive = true
        beatGrooveEditerSeparatorView.widthAnchor.constraint(equalToConstant: 1.2).isActive = true
        beatGrooveEditerSeparatorView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.995).isActive = true
        
        
        
        beatGrooveEditerView.addSubview(noteButtonsContainerView)
        
        noteButtonsContainerView.leftAnchor.constraint(equalTo: beatGrooveEditerView.leftAnchor, constant: view.frame.width * 0.3 * 0.108).isActive = true
        noteButtonsContainerView.topAnchor.constraint(equalTo: beatGrooveEditerView.topAnchor, constant: view.frame.height * 0.14).isActive = true
        noteButtonsContainerView.heightAnchor.constraint(equalTo: beatGrooveEditerView.heightAnchor, multiplier: 0.33).isActive = true
        noteButtonsContainerView.widthAnchor.constraint(equalTo: noteButtonsContainerView.heightAnchor).isActive = true
        
        setupNoteButtonsContainerView()
        
        
        
        beatGrooveEditerView.addSubview(recordWaveView)
        beatGrooveEditerView.addSubview(recordButton)
        beatGrooveEditerView.addSubview(editViewVolumContainerView)
        
        
        editViewVolumContainerView.centerXAnchor.constraint(equalTo: noteButtonsContainerView.centerXAnchor).isActive = true
        editViewVolumContainerView.topAnchor.constraint(equalTo: noteButtonsContainerView.bottomAnchor, constant: view.frame.height * 0.125).isActive = true
        editViewVolumContainerView.heightAnchor.constraint(equalTo: noteButtonsContainerView.heightAnchor, multiplier: 0.09).isActive = true
        editViewVolumContainerView.widthAnchor.constraint(equalTo: noteButtonsContainerView.widthAnchor, multiplier: 0.97).isActive = true
        
        setupEditViewVolumContainerView()

        
        
        recordWaveView.translatesAutoresizingMaskIntoConstraints = false
        recordWaveView.backgroundColor = UIColor.clear

        recordWaveView.centerXAnchor.constraint(equalTo: noteButtonsContainerView.centerXAnchor).isActive = true
        recordWaveView.topAnchor.constraint(equalTo: noteButtonsContainerView.bottomAnchor, constant: view.frame.height * 0.28).isActive = true
        recordWaveView.heightAnchor.constraint(equalTo: noteButtonsContainerView.heightAnchor, multiplier: 0.2).isActive = true
        recordWaveView.widthAnchor.constraint(equalTo: noteButtonsContainerView.widthAnchor).isActive = true
        
        
        recordButton.centerXAnchor.constraint(equalTo: recordWaveView.centerXAnchor).isActive = true
        recordButton.topAnchor.constraint(equalTo: recordWaveView.bottomAnchor, constant: view.frame.height * 0.01).isActive = true
        recordButton.widthAnchor.constraint(equalTo: recordWaveView.widthAnchor, multiplier: 0.25).isActive = true
        recordButton.heightAnchor.constraint(equalTo: recordButton.widthAnchor).isActive = true
        
    }
    
    func setupEditViewVolumContainerView() {
        

        editViewVolumContainerView.addSubview(editViewVolumLable)
        editViewVolumContainerView.addSubview(editViewVolumeSlider)
        
        
        
        editViewVolumLable.leftAnchor.constraint(equalTo: editViewVolumContainerView.leftAnchor).isActive = true
        editViewVolumLable.centerYAnchor.constraint(equalTo: editViewVolumContainerView.centerYAnchor).isActive = true
        editViewVolumLable.widthAnchor.constraint(equalTo: editViewVolumContainerView.widthAnchor, multiplier: 0.3).isActive = true
        editViewVolumLable.heightAnchor.constraint(equalTo: editViewVolumContainerView.heightAnchor).isActive = true
        
        editViewVolumeSlider.leftAnchor.constraint(equalTo: editViewVolumLable.rightAnchor).isActive = true
        editViewVolumeSlider.centerYAnchor.constraint(equalTo: editViewVolumContainerView.centerYAnchor).isActive = true
        editViewVolumeSlider.widthAnchor.constraint(equalTo: editViewVolumContainerView.widthAnchor, multiplier: 0.7).isActive = true
        editViewVolumeSlider.heightAnchor.constraint(equalTo: editViewVolumContainerView.heightAnchor).isActive = true
    }
    
    
    func setupNoteButtonsContainerView() {
        for i in 0..<noteButton.count {
            noteButton[i].tag = i
            
            noteButtonsContainerView.addSubview(noteButton[i])
            
            let containerWidth = view.frame.height * 0.33
            
            noteButton[i].leftAnchor.constraint(equalTo: noteButtonsContainerView.leftAnchor, constant: containerWidth * 0.26 * CGFloat(i % 4)).isActive = true
            noteButton[i].topAnchor.constraint(equalTo: noteButtonsContainerView.topAnchor, constant: containerWidth * 0.26 * CGFloat(i / 4)).isActive = true
            noteButton[i].heightAnchor.constraint(equalTo: noteButtonsContainerView.heightAnchor, multiplier: 0.22).isActive = true
            noteButton[i].widthAnchor.constraint(equalTo: noteButton[i].heightAnchor).isActive = true
            
            noteButton[i].layer.cornerRadius = containerWidth * 0.22 / 2
        }
    }
    
    func setupDrumView() {
        
        drumView.backgroundColor = UIColor.appStyleColor.backgroundBlack
        
        drumView.layer.zPosition = -10
        
        view.addSubview(drumView)
        
        drumView.rightAnchor.constraint(equalTo: beatGrooveEditerSeparatorView.leftAnchor).isActive = true
        drumView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        drumView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        drumView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        drumView.addSubview(drumContainerView)
        
        drumContainerView.centerXAnchor.constraint(equalTo: drumView.centerXAnchor).isActive = true
        drumContainerView.centerYAnchor.constraint(equalTo: drumView.centerYAnchor, constant: 0.0).isActive = true
        drumContainerView.widthAnchor.constraint(equalTo: drumView.widthAnchor, multiplier: 0.89).isActive = true
        drumContainerViewHeightAnchor = drumContainerView.heightAnchor.constraint(equalTo: drumView.heightAnchor, multiplier: 0.8)
        drumContainerViewHeightAnchor?.isActive = true
        
        setupDrumContainerView()
        
    }
    
    func setupDrumContainerView() {
        
        drumContainerView.addSubview(drumButtonContainerView)
        drumContainerView.addSubview(drumSideButtonContainerView)
        

        drumButtonContainerView.leftAnchor.constraint(equalTo: drumContainerView.leftAnchor).isActive = true
        drumButtonContainerView.topAnchor.constraint(equalTo: drumContainerView.topAnchor).isActive = true
        drumButtonContainerViewHeightAnchor = drumButtonContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
        drumButtonContainerViewHeightAnchor?.isActive = true
        drumButtonContainerView.widthAnchor.constraint(equalTo: drumButtonContainerView.heightAnchor).isActive = true

        
        
        drumSideButtonContainerView.rightAnchor.constraint(equalTo: drumContainerView.rightAnchor).isActive = true
        drumSideButtonContainerView.bottomAnchor.constraint(equalTo: drumContainerView.bottomAnchor).isActive = true
        drumSideButtonContainerView.heightAnchor.constraint(equalTo: drumButtonContainerView.heightAnchor, multiplier: 1).isActive = true
        drumSideButtonContainerView.widthAnchor.constraint(equalToConstant: drumButtonWidth).isActive = true

        
        
        setupDrumButton()
        
    }
    
    func setupDrumButton() {
        for i in 0..<drumButton.count {
            drumButton[i].tag = i
            
            drumButtonContainerView.addSubview(drumButton[i])
            
            let drumButtonContainerViewHeight = view.frame.height * 0.8
            
            if i == 0{
                drumButton[i].leftAnchor.constraint(equalTo: drumButtonContainerView.leftAnchor).isActive = true
                drumButton[i].topAnchor.constraint(equalTo: drumButtonContainerView.topAnchor).isActive = true
                drumButton[i].heightAnchor.constraint(equalTo: drumButtonContainerView.heightAnchor, multiplier: 0.3).isActive = true
                drumButtonWidthAnchor = drumButton[i].widthAnchor.constraint(equalTo: drumButton[i].heightAnchor)
                drumButtonWidthAnchor?.isActive = true
            }else{
                drumButtonLeftAnchor[i] = drumButton[i].leftAnchor.constraint(equalTo: drumButton[0].leftAnchor, constant: drumButtonContainerViewHeight * 0.35 * CGFloat(i%3))
                drumButtonLeftAnchor[i]?.isActive = true
                drumButtonTopAnchor[i] = drumButton[i].topAnchor.constraint(equalTo: drumButton[0].topAnchor, constant: drumButtonContainerViewHeight * 0.35 * CGFloat(i/3))
                drumButtonTopAnchor[i]?.isActive = true
                drumButton[i].widthAnchor.constraint(equalTo: drumButton[0].widthAnchor).isActive = true
                drumButton[i].heightAnchor.constraint(equalTo: drumButton[0].heightAnchor).isActive = true
            }
        }
        
        for i in 0..<drumSideButton.count {
            drumSideButton[i].tag = i
            
            drumSideButtonContainerView.addSubview(drumSideButton[i])
            
            
            drumSideButtonRightAnchor[i] = drumSideButton[i].rightAnchor.constraint(equalTo: drumSideButtonContainerView.rightAnchor)
            drumSideButtonRightAnchor[i]?.isActive = true
            drumSideButtonBottomAnchor[i] = drumSideButton[i].bottomAnchor.constraint(equalTo: drumButton[3*i].bottomAnchor)
            drumSideButtonBottomAnchor[i]?.isActive = true
            drumSideButton[i].widthAnchor.constraint(equalTo: drumButton[0].widthAnchor).isActive = true
            drumSideButton[i].heightAnchor.constraint(equalTo: drumButton[0].heightAnchor).isActive = true
        }
        
        
        
        let sliderThumbImage = UIImage().resizeImage(newSize: CGSize(width: 0.5, height: drumButtonWidth))

        for i in 0..<drumVolumeSlider.count {
            
            drumVolumeSlider[i].tag = i
            
            if i < drumButton.count {
                drumButton[i].addSubview(drumVolumeSlider[i])
                
                drumVolumeSlider[i].centerXAnchor.constraint(equalTo: drumButton[i].centerXAnchor).isActive = true
                drumVolumeSlider[i].centerYAnchor.constraint(equalTo: drumButton[i].centerYAnchor).isActive = true
                drumVolumeSlider[i].widthAnchor.constraint(equalTo: drumButton[i].heightAnchor).isActive = true
                drumVolumeSlider[i].heightAnchor.constraint(equalTo: drumButton[i].widthAnchor).isActive = true
            }else{
                let n = i - drumButton.count
                drumSideButton[n].addSubview(drumVolumeSlider[i])

                drumVolumeSlider[i].centerXAnchor.constraint(equalTo: drumSideButton[n].centerXAnchor).isActive = true
                drumVolumeSlider[i].centerYAnchor.constraint(equalTo: drumSideButton[n].centerYAnchor).isActive = true
                drumVolumeSlider[i].widthAnchor.constraint(equalTo: drumSideButton[n].heightAnchor).isActive = true
                drumVolumeSlider[i].heightAnchor.constraint(equalTo: drumSideButton[n].widthAnchor).isActive = true
            }
            drumVolumeSlider[i].setThumbImage(sliderThumbImage, for: .normal)
            drumVolumeSlider[i].isHidden = true
        
        }
        
    }
    
    func setupBPMView() {
        BPMContainerView.frame = view.frame
        BPMBackgroundView.frame = BPMContainerView.frame
        BPMCover.frame = CGRect(x: BPMContainerView.frame.midX - BPMContainerView.frame.height / 4 , y: BPMContainerView.frame.midY / 2, width: BPMContainerView.frame.height / 2, height: BPMContainerView.frame.height / 2)
        
        view.addSubview(BPMContainerView)
        BPMContainerView.addSubview(BPMBackgroundView)
        
        BPMContainerView.addSubview(BPMCover)
        
        BPMContainerView.addSubview(BPMButtonContainerView)
        
        BPMButtonContainerView.alpha = 1.0
        
        BPMButtonContainerView.centerXAnchor.constraint(equalTo: BPMBackgroundView.centerXAnchor).isActive = true
        BPMButtonContainerView.centerYAnchor.constraint(equalTo: BPMBackgroundView.centerYAnchor).isActive = true
        BPMButtonContainerView.heightAnchor.constraint(equalTo: BPMBackgroundView.heightAnchor, multiplier: 0.4).isActive = true
        BPMButtonContainerView.widthAnchor.constraint(equalTo: BPMButtonContainerView.heightAnchor).isActive = true
        
        
        BPMButtonContainerView.addSubview(BPMPlusButton)
        BPMButtonContainerView.addSubview(BPMMinusButton)
        BPMMinusButton.style = false
        
        BPMPlusButton.topAnchor.constraint(equalTo: BPMButtonContainerView.topAnchor).isActive = true
        BPMPlusButton.bottomAnchor.constraint(equalTo: BPMButtonContainerView.centerYAnchor).isActive = true
        BPMPlusButton.leftAnchor.constraint(equalTo: BPMButtonContainerView.leftAnchor).isActive = true
        BPMPlusButton.rightAnchor.constraint(equalTo: BPMButtonContainerView.rightAnchor).isActive = true
        
        BPMMinusButton.topAnchor.constraint(equalTo: BPMPlusButton.bottomAnchor).isActive = true
        BPMMinusButton.bottomAnchor.constraint(equalTo: BPMButtonContainerView.bottomAnchor).isActive = true
        BPMMinusButton.leftAnchor.constraint(equalTo: BPMButtonContainerView.leftAnchor).isActive = true
        BPMMinusButton.rightAnchor.constraint(equalTo: BPMButtonContainerView.rightAnchor).isActive = true

        
        
    }
    
}
