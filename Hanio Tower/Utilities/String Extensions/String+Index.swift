//
//  String+Index.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 Ding. All rights reserved.
//

import Foundation

// MARK: - Subscript for index, position of substring and so on
public extension String {
    /// Character of index(Int)
    public subscript(index: Int) -> Character {
        let index = characters.index(startIndex, offsetBy: index)
        return self[index]
    }
    
    /// Cut string from range
    public subscript(range: CountableClosedRange<Int>) -> String {
        let start = characters.index(startIndex, offsetBy: range.lowerBound)
        let end = characters.index(startIndex, offsetBy: range.upperBound)
        let range = start..<end
        return self[range]
    }
    /// Cut string from range
    public subscript(range: CountableRange<Int>) -> String {
        let start = characters.index(startIndex, offsetBy: range.lowerBound)
        let end = characters.index(startIndex, offsetBy: range.upperBound - 1)
        let range = start..<end
        return self[range]
    }
    
    /// Cut string from an integer index
    public func sub(from index: Int) -> String {
        return substring(from: self.index(startIndex, offsetBy: index))
    }
    /// Cut string to an interger index
    public func sub(to index: Int) -> String {
        return substring(to: self.index(endIndex, offsetBy: index-characters.count + 1))
    }
    
    /// Position of begining character of substing
    public func indexOf(_ subString: String, caseInsensitive: Bool = false, fromEnd: Bool = false) -> Int {
        if subString.isEmpty {
            return -1
        }
        var searchOption = fromEnd ? NSString.CompareOptions.anchored : NSString.CompareOptions.backwards
        if caseInsensitive {
            searchOption.insert(NSString.CompareOptions.caseInsensitive)
        }
        if let range = self.range(of: subString, options: searchOption) , !range.isEmpty {
            return self.characters.distance(from: self.startIndex, to: range.lowerBound)
        }
        return -1
    }
    
    /// Returns the first index of the occurency of the character in String
    public func indexOf(_ char: Character) -> Int? {
        for (index, c) in characters.enumerated() {
            if c == char {
                return index
            }
        }
        return nil
    }

}
