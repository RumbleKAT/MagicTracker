//
//  BatterySruct.swift
//  Magic Mouse Battery
//
//  Created by 송명진 on 2018. 7. 28..
//  Copyright © 2018년 송명진. All rights reserved.
//

import Foundation


struct Battery{
    var name: String
    var percent : Int
    
    init(name: String, percent: Int){
        self.name = name
        self.percent = percent
    }
}

struct Regex {
    
    struct Match {
        var wholeString = ""
        var groups = [String]()
        
        init(wholeString: String, groups: [String]) {
            self.wholeString = wholeString
            self.groups = groups
        }
        
        init(text: NSString, result res: NSTextCheckingResult) {
            let components = (0..<res.numberOfRanges).map { text.substring(with: res.range(at: $0)) }
            self.wholeString = components[0]
            self.groups = components.dropFirst().map { $0 }
        }
    }
    
    fileprivate let regex: NSRegularExpression
    
    static func of(_ pattern: String, options: NSRegularExpression.Options = []) -> Regex? {
        return try? Regex(pattern, options: options)
    }
    
    init(_ pattern: String, options: NSRegularExpression.Options = []) throws {
        do {
            self.regex = try NSRegularExpression(pattern: pattern, options: options)
        }
    }
    
    func firstMatch(_ string: String, range: NSRange? = nil, options: NSRegularExpression.MatchingOptions = []) -> Match? {
        let targetRange = range ?? string.wholeNSRange()
        let nsstring = string as NSString
        if let res = self.regex.firstMatch(in: string, options: options, range: targetRange) {
            return Regex.Match(text: nsstring, result: res)
        } else {
            return nil
        }
    }
    
    func matches(_ string: String, range: NSRange? = nil, options: NSRegularExpression.MatchingOptions = []) -> [Match] {
        let targetRange = range ?? string.wholeNSRange()
        let nsstring = string as NSString
        return self.regex.matches(in: string, options: options, range: targetRange).map { res in
            return Regex.Match(text: nsstring, result: res)
        }
    }
}

extension String{
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    
    fileprivate func wholeRange() -> Range<String.Index> {
        return Range(uncheckedBounds: (self.startIndex, self.endIndex))
    }
    
    fileprivate func wholeNSRange() -> NSRange {
        return NSRange(location: 0, length: self.count)
    }
    
    func replace(_ regex: Regex, template: String, range: NSRange? = nil, options: NSRegularExpression.MatchingOptions = []) -> String {
        let targetRange = range ?? self.wholeNSRange()
        return regex.regex.stringByReplacingMatches(in: self, options: options, range: targetRange, withTemplate: template)
    }
}

