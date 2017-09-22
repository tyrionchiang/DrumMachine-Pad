//
//  MainUINavigationController.swift
//  DrumMachine-Pad
//
//  Created by Chiang Chuan on 24/04/2017.
//  Copyright © 2017 Chiang Chuan. All rights reserved.
//

import UIKit

class MainUINavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationBar.isHidden = true
        navigationBar.barStyle = UIBarStyle.blackTranslucent
        
        self.viewControllers.append(ViewController())
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
