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
        
        testCall(callback: testCall2)

    }
    
    func testCall2(){
        print("!!!")
    }

    override var representedObject: Any? {
        didSet {
        }
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

