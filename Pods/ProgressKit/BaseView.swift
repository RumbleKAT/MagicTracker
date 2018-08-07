//
//  BaseView.swift
//  ProgressKit
//
//  Created by Kauntey Suryawanshi on 04/10/15.
//  Copyright (c) 2015 Kauntey Suryawanshi. All rights reserved.
//

import AppKit

@IBDesignable
open class BaseView : NSView {

    override public init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.configureLayers()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureLayers()
    }

    /// Configure the Layers
    func configureLayers() {
        self.wantsLayer = true
        notifyViewRedesigned()
    }

    @IBInspectable open var background: NSColor = NSColor(red: 88.3 / 256, green: 104.4 / 256, blue: 118.5 / 256, alpha: 0.1) {
        didSet {
            self.notifyViewRedesigned()
        }
    }

    @IBInspectable open var foreground: NSColor = NSColor(red: 1, green: 1, blue: 1, alpha: 1.0) {
        didSet {
            self.notifyViewRedesigned()
        }
    }
    
    @IBInspectable open var middleground: NSColor = NSColor(red: 0, green: 1, blue: 0, alpha: 1.0) {
        didSet {
            self.notifyViewRedesigned()
        }
    }


    @IBInspectable open var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.notifyViewRedesigned()
        }
    }

    /// Call when any IBInspectable variable is changed
    func notifyViewRedesigned() {
        self.layer?.backgroundColor = background.cgColor
        self.layer?.cornerRadius = cornerRadius
    }
}
