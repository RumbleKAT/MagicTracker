//
//  ThreadManager.swift
//  Magic Mouse Battery
//
//  Created by 송명진 on 2018. 7. 10..
//  Copyright © 2018년 송명진. All rights reserved.
//

import Foundation

class ThreadManager{
    
    let queue:DispatchQueue
    
    init() {
        queue = DispatchQueue(label: "task")
    }
    
    public func setThread(_ callback: @escaping () -> Void){
        queue.async {
            callback()
        }
    }
}
