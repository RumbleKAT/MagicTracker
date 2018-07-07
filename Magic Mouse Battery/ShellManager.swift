//
//  ShellManager.swift
//  Magic Mouse Battery
//
//  Created by 송명진 on 2018. 7. 8..
//  Copyright © 2018년 송명진. All rights reserved.
//

import Foundation

class ShellManager{
    private func shell(command: String) -> String{
        let task = Process()
        task.launchPath = "/bin/bash"
        task.arguments = ["-c", command]
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: String.Encoding.utf8)!
        if output.count > 0{
            let lastIndex = output.index(before: output.endIndex)
            return String(output[output.startIndex ..< lastIndex])
        }
        return output
    }

    public func bash(_ command: String) -> String {
        return shell(command: command)
    }
}



