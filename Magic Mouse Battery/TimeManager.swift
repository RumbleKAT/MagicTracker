//
//  TimeManager.swift
//  Magic Mouse Battery
//
//  Created by 송명진 on 2018. 7. 8..
//  Copyright © 2018년 송명진. All rights reserved.
//

import Foundation

class TimeManager{
    var interval: Double
    var timer: Timer?
    var count: Int
    
    init(){
        interval = 0.0
        count = 0
    }
    
    public func setInterval(_ param: Double){
        self.interval = param
        setTimer(true)
    }
    
    func setTimer(_ check: Bool){
        if(check){
            self.timer = Timer.scheduledTimer(timeInterval: self.interval, target: self, selector: #selector(callFunction), userInfo: nil, repeats: true)
        }
        else{
            self.timer = Timer.scheduledTimer(timeInterval: self.interval, target: self, selector: #selector(callFunction), userInfo: nil, repeats: false)
        }
    }

    @objc
    func callFunction(callback: () -> Void){
        print(count)
        if(count % 10 == 0){
            callback()
        }
        count += 1
    }
    
}
