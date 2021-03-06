//
//  NSDictionaryExtension.swift
//  SquidKit
//
//  Created by Mike Leavy on 8/16/14.
//  Copyright (c) 2014 SquidKit. All rights reserved.
//

import Foundation

public extension NSDictionary {
    
    public class func dictionaryFromResourceFile(fileName:String) -> NSDictionary? {
        
        if let inputStream = NSInputStream(fileAtPath:String.stringWithPathToResourceFile(fileName)) {
            inputStream.open()
            var error:NSErrorPointer = nil
            let dictionary:NSDictionary? = NSJSONSerialization.JSONObjectWithStream(inputStream, options:nil, error: error) as? NSDictionary
            inputStream.close()
            
            return dictionary
            
        }
        
        return nil
    }
}