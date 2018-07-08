//
//  Message.swift
//  Magic Mouse Battery
//
//  Created by 송명진 on 2018. 7. 8..
//  Copyright © 2018년 송명진. All rights reserved.
//

import Foundation

struct Message{
    var title:String = ""
    var description:String = ""
    
    init(){}
    
    init(_ title: String ,_ description: String){
        self.title = title
        self.description = description
    }
    
    func toString() -> String {
        return title + " :: " + description
    }
}
