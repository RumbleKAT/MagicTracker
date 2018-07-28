//
//  TabViewController.swift
//  Magic Mouse Battery
//
//  Created by 송명진 on 2018. 7. 25..
//  Copyright © 2018년 송명진. All rights reserved.
//

import Cocoa

class TabViewController: NSViewController {

    @IBOutlet weak var batteryTitle: NSTextField!
    @IBOutlet weak var batteryPercent: NSTextField!
    @IBOutlet weak var batteryProgress: NSLevelIndicatorCell!
    
    let appDelegate = NSApplication.shared.delegate as! AppDelegate
    let shellManager = ShellManager()
    var batteries = [Battery]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func optionClicked(_ sender: NSButton) {
        print("!!")
        constructMenu(sender)
    }

    
    @objc func test(_ sender : Any?){
        print("test!!!")
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
    }
    
    public func updateView(){
        print("!!")
        getBattery()
    }
    
    private func parsing(_ command : String) -> [Battery]{
        let arr = command.split(separator: "\n")
        var temp_batteries = [Battery]()
        
        var idx = 0
        for _ in 0...(arr.count/2)-1{
            let product:String = String(arr[idx].split(separator: "=")[1]).trimmingCharacters(in: .whitespaces)
            let percent:String = String(arr[idx+1].split(separator: "=")[1]).trimmingCharacters(in: .whitespaces)
            temp_batteries.append(Battery(name: String(product), percent: Int(percent)!))
            idx += 2
        }
        
        return temp_batteries
    }
    
    private func draw(){
        self.batteryTitle.stringValue = batteries[0].name
        self.batteryPercent.stringValue = String(batteries[0].percent) + "%"
        self.batteryProgress.intValue = Int32(batteries[0].percent/10)
    }
    
    private func getBattery() -> Void{
        let str_command = "ioreg -r -d 1 -k BatteryPercent | egrep '(\"BatteryPercent\"|\"Product\") '"
        let command : String = shellManager.bash(str_command).trimmingCharacters(in: .whitespaces)

        self.batteries = parsing(command)
        draw()
    }
    
}
