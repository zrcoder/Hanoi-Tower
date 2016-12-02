//
//  String+Count.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 Ding. All rights reserved.
//

import Foundation

public extension String {
    
    /// Character count
    public var length: Int {
        return self.characters.count
    }
    
    /// Counts number of instances of the input inside String
    public func countOf(_ substring: String) -> Int {
        return components(separatedBy: substring).count - 1
    }
    
    /// Returns count of words in string
    public var countOfWords: Int {
        let regex = try? NSRegularExpression(pattern: "\\w+", options: NSRegularExpression.Options())
        return regex?.numberOfMatches(in: self, options: NSRegularExpression.MatchingOptions(), range: NSRange(location: 0, length: self.length)) ?? 0
    }

    /// Returns count of paragraphs in string
    public var countOfParagraphs: Int {
        let regex = try? NSRegularExpression(pattern: "\\n", options: NSRegularExpression.Options())
        let str = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return (regex?.numberOfMatches(in: str, options: NSRegularExpression.MatchingOptions(), range: NSRange(location:0, length: str.length)) ?? -1) + 1
    }
    
}
