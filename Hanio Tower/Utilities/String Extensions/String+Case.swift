//
//  String+Case.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 Ding. All rights reserved.
//

// MARK: - upercase, lowercase
public extension String {
    
    /// Capitalizes first character of String
    public mutating func capitalizeFirst() {
        guard characters.count > 0 else { return }
        self.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).capitalized)
    }
    
    /// Capitalizes first character of String, returns a new string
    public func capitalizedFirst() -> String {
        guard characters.count > 0 else { return self }
        var result = self
        result.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).capitalized)
        return result
    }
    
    /// Uppercases first 'count' characters of String
    public mutating func uppercasePrefix(_ count: Int) {
        guard characters.count > 0 && count > 0 else { return }
        self.replaceSubrange(startIndex..<index(startIndex, offsetBy: min(count, characters.count)),
                          with: String(self[startIndex..<index(startIndex, offsetBy: min(count, characters.count))]).uppercased())
    }
    
    /// Uppercases first 'count' characters of String, returns a new string
    public func uppercasedPrefix(_ count: Int) -> String {
        guard characters.count > 0 && count > 0 else { return self }
        var result = self
        result.replaceSubrange(startIndex..<characters.index(startIndex, offsetBy: min(count, characters.count)),
                            with: String(self[startIndex..<characters.index(startIndex, offsetBy: min(count, characters.count))]).uppercased())
        return result
    }
    
    /// Uppercases last 'count' characters of String
    public mutating func uppercaseSuffix(_ count: Int) {
        guard characters.count > 0 && count > 0 else { return }
        self.replaceSubrange(index(endIndex, offsetBy: -min(count, characters.count))..<endIndex,
                          with: String(self[index(endIndex, offsetBy: -min(count, characters.count))..<endIndex]).uppercased())
    }
    
    /// Uppercases last 'count' characters of String, returns a new string
    public func uppercasedSuffix(_ count: Int) -> String {
        guard characters.count > 0 && count > 0 else { return self }
        var result = self
        result.replaceSubrange(characters.index(endIndex, offsetBy: -min(count, characters.count))..<endIndex,
                            with: String(self[characters.index(endIndex, offsetBy: -min(count, characters.count))..<endIndex]).uppercased())
        return result
    }
    
    /// Uppercases string in range 'range' (from range.startIndex to range.endIndex)
    public mutating func uppercase(range: Range<Int>) {
        let from = max(range.lowerBound, 0), to = min(range.upperBound, characters.count)
        guard characters.count > 0 && (0..<characters.count).contains(from) else { return }
        self.replaceSubrange(index(startIndex, offsetBy: from)..<index(startIndex, offsetBy: to),
                          with: String(self[index(startIndex, offsetBy: from)..<index(startIndex, offsetBy: to)]).uppercased())
    }
    
    /// Uppercases string in range 'range' (from range.startIndex to range.endIndex), returns new string
    public func uppercased(range: Range<Int>) -> String {
        let from = max(range.lowerBound, 0), to = min(range.upperBound, characters.count)
        guard characters.count > 0 && (0..<characters.count).contains(from) else { return self }
        var result = self
        result.replaceSubrange(characters.index(startIndex, offsetBy: from)..<characters.index(startIndex, offsetBy: to),
                            with: String(self[characters.index(startIndex, offsetBy: from)..<characters.index(startIndex, offsetBy: to)]).uppercased())
        return result
    }
    
    /// Lowercases first character of String
    public mutating func lowercaseFirst() {
        guard characters.count > 0 else { return }
        self.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).lowercased())
    }
    
    /// Lowercases first character of String, returns a new string
    public func lowercasedFirst() -> String {
        guard characters.count > 0 else { return self }
        var result = self
        result.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).lowercased())
        return result
    }
    
    /// Lowercases first 'count' characters of String
    public mutating func lowercasePrefix(_ count: Int) {
        guard characters.count > 0 && count > 0 else { return }
        self.replaceSubrange(startIndex..<index(startIndex, offsetBy: min(count, characters.count)),
                          with: String(self[startIndex..<index(startIndex, offsetBy: min(count, characters.count))]).lowercased())
    }
    
    /// Lowercases first 'count' characters of String, returns a new string
    public func lowercasedPrefix(_ count: Int) -> String {
        guard characters.count > 0 && count > 0 else { return self }
        var result = self
        result.replaceSubrange(startIndex..<characters.index(startIndex, offsetBy: min(count, characters.count)),
                            with: String(self[startIndex..<characters.index(startIndex, offsetBy: min(count, characters.count))]).lowercased())
        return result
    }
    
    /// Lowercases last 'count' characters of String
    public mutating func lowercaseSuffix(_ count: Int) {
        guard characters.count > 0 && count > 0 else { return }
        self.replaceSubrange(index(endIndex, offsetBy: -min(count, characters.count))..<endIndex,
                          with: String(self[index(endIndex, offsetBy: -min(count, characters.count))..<endIndex]).lowercased())
    }
    
    /// Lowercases last 'count' characters of String, returns a new string
    public func lowercasedSuffix(_ count: Int) -> String {
        guard characters.count > 0 && count > 0 else { return self }
        var result = self
        result.replaceSubrange(characters.index(endIndex, offsetBy: -min(count, characters.count))..<endIndex,
                            with: String(self[characters.index(endIndex, offsetBy: -min(count, characters.count))..<endIndex]).lowercased())
        return result
    }
    
    /// Lowercases string in range 'range' (from range.startIndex to range.endIndex)
    public mutating func lowercase(range: Range<Int>) {
        let from = max(range.lowerBound, 0), to = min(range.upperBound, characters.count)
        guard characters.count > 0 && (0..<characters.count).contains(from) else { return }
        self.replaceSubrange(index(startIndex, offsetBy: from)..<index(startIndex, offsetBy: to),
                          with: String(self[index(startIndex, offsetBy: from)..<index(startIndex, offsetBy: to)]).lowercased())
    }
    
    /// Lowercases string in range 'range' (from range.startIndex to range.endIndex), returns new string
    public func lowercased(range: Range<Int>) -> String {
        let from = max(range.lowerBound, 0), to = min(range.upperBound, characters.count)
        guard characters.count > 0 && (0..<characters.count).contains(from) else { return self }
        var result = self
        result.replaceSubrange(characters.index(startIndex, offsetBy: from)..<characters.index(startIndex, offsetBy: to),
                            with: String(self[characters.index(startIndex, offsetBy: from)..<characters.index(startIndex, offsetBy: to)]).lowercased())
        return result
    }
}
