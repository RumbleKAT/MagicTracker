//
//  ViewController.swift
//  Magic Mouse Battery
//
//  Created by 송명진 on 2018. 7. 8..
//  Copyright © 2018년 송명진. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let shellManager = ShellManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let command = shellManager.bash("")
        print(command)
        
        let timer = TimeManager()
        timer.setInterval(2.0)
        
    }

    override var representedObject: Any? {
        didSet {
        }
    }


}

