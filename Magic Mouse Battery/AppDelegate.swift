//
//  AppDelegate.swift
//  Magic Mouse Battery
//
//  Created by 송명진 on 2018. 7. 8..
//  Copyright © 2018년 송명진. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    let popover = NSPopover()
    var tabviewController : TabViewController? = nil

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named:NSImage.Name("batteryIcon"))
            button.action = #selector(togglePopover(_:))
        }
        popover.contentViewController = TabViewController.freshController()
        tabviewController = popover.contentViewController as? TabViewController
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        print("release Memory!")
    }
    
    @objc func togglePopover(_ sender: Any?){
        if popover.isShown{
            closePopover(sender: sender)
        }else{
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender : Any?){
        if let button = statusItem.button{
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
        tabviewController?.updateView()
    }
    
    func closePopover(sender: Any?){
        popover.performClose(sender)
    }
}


