//
//  String+File.swift
//  SquidKit
//
//  Created by Mike Leavy on 8/16/14.
//  Copyright (c) 2014 SquidKit. All rights reserved.
//

import Foundation

public extension String {
    
    public static func stringWithPathToResourceDirectory() -> String {
        return NSBundle.mainBundle().resourcePath!
    }
    
    public static func stringWithPathToResourceFile(fileName:String) -> String {
        var path = String.stringWithPathToResourceDirectory()
        path = path.stringByAppendingPathComponent(fileName)
        return path
    }
    
    public static func stringWithContentsOfResourceFile(fileName:String) -> String? {
        var filePath = String.stringWithPathToResourceFile(fileName)
        if let data = NSFileManager.defaultManager().contentsAtPath(filePath) {
            return NSString(data:data, encoding:NSUTF8StringEncoding) as? String
        }
        
        return nil
    }
    
    public static func pathToApplicationBundle() -> String {
        return NSBundle.mainBundle().bundlePath
    }
    
    public static func pathToDocumentsDirectory() -> String? {
        
        return String.pathToUserDirectory(NSSearchPathDirectory.DocumentDirectory)
    }
    
    public static func pathToCacheDirectory() -> String? {
        
        return String.pathToUserDirectory(NSSearchPathDirectory.CachesDirectory)
    }
    
    public static func pathToUserDirectory(directory: NSSearchPathDirectory) -> String? {
        
        if let directories:[String] = NSSearchPathForDirectoriesInDomains(directory, NSSearchPathDomainMask.UserDomainMask, true) as? [String] {
            return directories.last!
        }
        return nil
    }
}