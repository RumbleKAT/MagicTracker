//
//  ViewController.swift
//  Magic Mouse Battery
//
//  Created by 송명진 on 2018. 7. 8..
//  Copyright © 2018년 송명진. All rights reserved.
//

import Cocoa
import ProgressKit

class ViewController: NSViewController {

    let shellManager = ShellManager()
    var batteries = [Battery]()
    var idx = 0;
    
    @IBOutlet weak var percentage: CircularProgressView!
    
    @IBOutlet weak var NextBtn: NSButton!
    @IBOutlet weak var AlramBtn: NSButton!
    
    @IBOutlet weak var batteryTitle: NSTextField!
    @IBOutlet weak var batteryPercent: NSButton!
    @IBOutlet weak var batteryProgress: NSLevelIndicator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        percentage.progress = 0.5
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        if(batteries.count-1 != idx){
            idx += 1
        }else{
            idx = 0
        }
        draw()
    }
    
    private func initialize(){
        NextBtn.image = NSImage(named:NSImage.Name("next"))
    }
    
    public func updateView(){
        getBattery()
    }
    
    private func parsing(_ command : String) throws -> [Battery]{
        let arr = command.split(separator: "\n")
        var temp_batteries = [Battery]()
        
        var idx = 0
        if(arr.count/3 > 0){
            for _ in 0...(arr.count/3)-1{
                let product:String = String(arr[idx].split(separator: "=")[1]).trimmingCharacters(in: .whitespaces)
                let percent:String = String(arr[idx+1].split(separator: "=")[1]).trimmingCharacters(in: .whitespaces)
                let charge:String = String(arr[idx+2].split(separator: "=")[1]).trimmingCharacters(in: .whitespaces)
                
                temp_batteries.append(Battery(name: String(product), percent: Int(percent)!,charge: Int(charge)!))
                idx += 3
            }
        }else{
            temp_batteries.append(Battery(name: "Unknown", percent: 0, charge: 0)) //call exception
        }
        
        return temp_batteries
    }
    
    
    private func draw(){
        self.batteryTitle.stringValue = batteries[idx].name.replacingOccurrences(of: "\"", with: "", options: NSString.CompareOptions.literal, range: nil)
        self.batteryPercent.stringValue = String(batteries[idx].percent) + "%"
        self.batteryProgress.intValue = Int32(batteries[idx].percent/10)
        percentage.progress = CGFloat(Int32(batteries[idx].percent/10))/10
    }
    
    private func getBattery() -> Void{
        let str_command = "ioreg -r -d 1 -k BatteryPercent | egrep '(\"BatteryPercent\"|\"Product\"|\"BatteryStatusFlags\")'"
        let command : String = shellManager.bash(str_command).trimmingCharacters(in: .whitespaces)
        
        self.batteries = try!parsing(command)
        
        draw()
    }
    
    func testCall(callback: () -> Void){
        print("!!")
        callback()
    }
    
    func notifiy(){
        let notification = NSUserNotification()
        notification.hasActionButton = true
        notification.title = "Title"
        notification.informativeText = "Text."
        
        NSUserNotificationCenter.default.deliver(notification)
    
        //check - if charged send notification
    }
}

extension ViewController{
    
    static func freshController() -> ViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "content")
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? ViewController else {
            fatalError("Why cant i find tab? - Check Main.storyboard")
        }
        return viewcontroller
    }
    
}

