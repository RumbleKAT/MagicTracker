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
    }
    
    @IBAction func optionClicked(_ sender: NSButton) {
        constructMenu(sender)
    }

    
    @objc func test(_ sender : Any?){
        //print("test!!!")
    }
    
}

extension TabViewController{
    
    static func freshController() -> TabViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "tab")
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? TabViewController else {
            fatalError("Why cant i find tab? - Check Main.storyboard")
        }
        return viewcontroller
    }
    
    
    
    func constructMenu(_ sender: NSButton){
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "test", action: #selector(test(_:)), keyEquivalent: "p"))
        menu.addItem(NSMenuItem.separator())
        
        menu.popUp(positioning: nil, at: NSPoint(x: 0, y: sender.frame.height), in: sender)
    } //option에 관한 함수
    
    
}
