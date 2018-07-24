//
//  TabViewController.swift
//  Magic Mouse Battery
//
//  Created by 송명진 on 2018. 7. 25..
//  Copyright © 2018년 송명진. All rights reserved.
//

import Cocoa

class TabViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
}

extension TabViewController{
    
    static func freshController() -> TabViewController {
        //1.
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "tab")
        
        print (storyboard)
        print(identifier)
        
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? TabViewController else {
            fatalError("Why cant i find tab? - Check Main.storyboard")
        }
        return viewcontroller
    }
}
