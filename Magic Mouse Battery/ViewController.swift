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

    let shellManager = ShellManager();
    
    @IBOutlet weak var percentage: CircularProgressView!
    // @IBOutlet weak var test: Crawler!
    
    @IBOutlet weak var NextBtn: NSButton!
    @IBOutlet weak var AlramBtn: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let command = shellManager.bash("")
        
        print(command)
        
        let timer = TimeManager()
        timer.setInterval(2.0)
        
        notifiy();
        
        let msg = Message("Song" , "Myungjin")
        print(msg.toString())
        print(msg.title)
        */
        
        //testCall(callback: testCall2)
        //progress.animated = true
        
     //   test.animate = true
        percentage.progress = 0.5
        
        print("Call subViewController")
        
    }
    
    func testCall(_ param:String){
        print("Param : " + param)
    }
    
    func testCall3(){
        for i in 0...100 {
            print(i)
        }
    }
    
    func testCall2(){
        print("!!!")
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
    
}

