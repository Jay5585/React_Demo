//
//  ExtentionUtility.swift
//  SculpTech_Practical
//
//  Created by VIJAY on 09/02/18.
//  Copyright © 2018 TestDemo. All rights reserved.
//

import UIKit


public extension NSArray {
    public func JSONString() -> NSString{
        var jsonString : NSString = ""
        
        do {
            let jsonData : Data = try JSONSerialization .data(withJSONObject: self, options: JSONSerialization.WritingOptions(rawValue : 0))
            jsonString = NSString(data: jsonData ,encoding: String.Encoding.utf8.rawValue)!
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return jsonString
    }
}

public extension NSDictionary {
    public func JSONString() -> NSString{
        var jsonString : NSString = ""
        
        do {
            let jsonData : Data = try JSONSerialization .data(withJSONObject: self, options: JSONSerialization.WritingOptions(rawValue : 0))
            jsonString = NSString(data: jsonData ,encoding: String.Encoding.utf8.rawValue)!
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return jsonString
    }
}


extension UIView {
    
    // Example use: myView.addBorder(toSide: .Left, withColor: UIColor.redColor().CGColor, andThickness: 1.0)
    
    enum ViewSide {
        case Left, Right, Top, Bottom
    }
    
    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color
        
        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }
        
        layer.addSublayer(border)
    }
}
