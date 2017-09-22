//
//  ViewController.swift
//  DrumMachine-Pad
//
//  Created by Chiang Chuan on 24/04/2017.
//  Copyright © 2017 Chiang Chuan. All rights reserved.
//

import UIKit

enum AppState {
    case menu
    case editting
    case BPM
    case volume
    case non
    static var current = AppState.menu
    static var last = AppState.non
}
enum EdittingState {
    case non
    case recording
    static var current = EdittingState.non
}

struct defaultValue {
    static let valume : Float = 0.7
}

class ViewController: UIViewController {
    
    var timer = Timer()
    
    
    //tap bar
    let tapBarView = basicUIView()
    let tapBarSeparatorView = basicUIView()
    
    let editButton = UIEditButton()
    let BPMButton = UIBPMButton()
    let volumeButton = UIVolumeButton()
    
    //beat groove
    let beatGrooveEditerView = basicUIView()
    let beatGrooveEditerSeparatorView = basicUIView()
    
    let noteButtonsContainerView = basicUIView()
    let noteButton : [UINoteButton] =
        [UINoteButton(),UINoteButton(),UINoteButton(),UINoteButton(),
        UINoteButton(),UINoteButton(),UINoteButton(),UINoteButton(),
        UINoteButton(),UINoteButton(),UINoteButton(),UINoteButton(),
        UINoteButton(),UINoteButton(),UINoteButton(),UINoteButton()]
    
    let recordWaveView = UIWaveView()
    let recordButton = UIRecordButton()
    
    let editViewVolumContainerView = basicUIView()
    let editViewVolumLable = UIAlignBottomLabel()
    let editViewVolumeSlider = UIEditViewVolumeSlider()
    
    
    //drum
    let drumButtonWidth = UIScreen.main.bounds.height * 0.8 * 0.3
    
    let drumView = basicUIView()
    
    let drumContainerView = basicUIView()
    let drumButtonContainerView = basicUIView()
    let drumSideButtonContainerView = basicUIView()
    
    let drumButton : [UIDrumButton] = [UIDrumButton(),UIDrumButton(),UIDrumButton(),
                                       UIDrumButton(),UIDrumButton(),UIDrumButton(),
                                       UIDrumButton(),UIDrumButton(),UIDrumButton()]
    let drumSideButton : [UIDrumButton] = [UIDrumButton(),UIDrumButton(),UIDrumButton()]
    
    let drumVolumeSlider : [UIDrumVolumeSlider] =
        [UIDrumVolumeSlider(), UIDrumVolumeSlider(), UIDrumVolumeSlider(),
         UIDrumVolumeSlider(), UIDrumVolumeSlider(), UIDrumVolumeSlider(),
         UIDrumVolumeSlider(), UIDrumVolumeSlider(), UIDrumVolumeSlider(),
         UIDrumVolumeSlider(), UIDrumVolumeSlider(), UIDrumVolumeSlider()]
    
    
    //BPM
    let BPMContainerView : UIView = {
        let view = UIView()
        view.layer.zPosition = 100
        view.isHidden = true
        return view
    }()
    let BPMBackgroundView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appStyleColor.dark
        view.alpha = 0.95
        return view
    }()
    
    let BPMCover = UIButton()
    
    let BPMButtonContainerView = UIBPMButtonContainerView()
    let BPMLabel = UILabel()
    let BPMVolumeLabel = UILabel()
    let BPMPlusButton = UIBPMPlusMinusButton()
    let BPMMinusButton = UIBPMPlusMinusButton()
    
    
    
    //Anchor
    var beatGrooveEditerViewWidthAnchor : NSLayoutConstraint?
    
    var drumContainerViewHeightAnchor : NSLayoutConstraint?
    var drumButtonContainerViewHeightAnchor : NSLayoutConstraint?
    var drumButtonWidthAnchor : NSLayoutConstraint?
    var drumButtonLeftAnchor : [NSLayoutConstraint?] = [NSLayoutConstraint(),NSLayoutConstraint(),NSLayoutConstraint()
    ,NSLayoutConstraint(),NSLayoutConstraint(),NSLayoutConstraint()
    ,NSLayoutConstraint(),NSLayoutConstraint(),NSLayoutConstraint()]
    var drumButtonTopAnchor : [NSLayoutConstraint?] = [NSLayoutConstraint(),NSLayoutConstraint(),NSLayoutConstraint()
        ,NSLayoutConstraint(),NSLayoutConstraint(),NSLayoutConstraint()
        ,NSLayoutConstraint(),NSLayoutConstraint(),NSLayoutConstraint()]
    
    var drumSideButtonRightAnchor : [NSLayoutConstraint?] = [NSLayoutConstraint(),NSLayoutConstraint(),NSLayoutConstraint()]
    var drumSideButtonBottomAnchor : [NSLayoutConstraint?] = [NSLayoutConstraint(),NSLayoutConstraint(),NSLayoutConstraint()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        addTarget()
        
        appInit()
        
//        drumContainerView.backgroundColor = UIColor.red
//        editViewVolumContainerView.backgroundColor = UIColor.red
//        editViewVolumLable.backgroundColor = UIColor.green
//        drumButtonContainerView.backgroundColor = UIColor.gray
//        drumButtonContainerView.alpha = 0.8
//        drumSideButtonContainerView.backgroundColor = UIColor.green

    }
    func appInit() {
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override var prefersStatusBarHidden: Bool{
        return true
    }

}

