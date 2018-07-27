//
//  TabViewController.swift
//  Magic Mouse Battery
//
//  Created by 송명진 on 2018. 7. 25..
//  Copyright © 2018년 송명진. All rights reserved.
//

import Cocoa

class TabViewController: NSViewController {

    @IBOutlet weak var MouseText: NSTextField!
    @IBOutlet weak var BatteryPercent: NSTextField!
    let appDelegate = NSApplication.shared.delegate as! AppDelegate

    let shellManager = ShellManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public func update(){
        print("!!")
        self.BatteryPercent.stringValue = getBattery()
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
    
    public func updateView(){
        self.BatteryPercent.stringValue = getBattery()
    }
    
    private func getBattery() -> String{
        let command:String = shellManager.bash("ls")
        return command
    }
    
}
