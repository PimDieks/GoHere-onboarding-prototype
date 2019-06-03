//
//  NSAttributedStringExtension.swift
//  Onboarding
//
//  Created by Pim Dieks on 20/05/2019.
//  Copyright © 2019 Pim Dieks. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    /**
    Define link points in a string
    */
    struct Link {
        let path: String
        let range: NSRange
    }
    
    /**
    Calculate substring based on string
    */
    static func rangeForSubstring(string: String, target: String) -> NSRange {
        let obcstring = NSString(string: string)
        return obcstring.range(of: target)
    }
    
    /**
    Create a attributes string with links for the given link objects
    */
    static func makeHyperlink(for string: String, links: [Link]) -> NSAttributedString {
        
        let attributedString = NSMutableAttributedString(string: string)
        
        links.forEach({
            attributedString.addAttribute(.link, value: $0.path, range: $0.range)
        })
        
        return attributedString
    }
    
    static func makeHyperlink (for path: String, in string: String, as substring: String) -> NSAttributedString {
        let nsString = NSString(string: string)
        let substringRange = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path, range: substringRange)
        return attributedString
    }

}
