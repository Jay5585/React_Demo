//
//  Car.swift
//  SculpTech_Practical
//
//  Created by VIJAY on 09/02/18.
//  Copyright © 2018 TestDemo. All rights reserved.
//

import UIKit

class Car: NSObject {
    var id : Int!
    var distance : String = ""
    var make : String = ""
    var miles : String = ""
    var model : String = ""
    var price : String = ""
    var shareurl : URL? = nil
    var status : String = ""
    var year : String = ""
    var imagelist : [String] = [String]()
    
    override init() {
        super.init()
        
    }
    
    init(dict : NSDictionary) {
        if let id : Int = dict.value(forKey: "id") as? Int {
            self.id = id
        }
        
        if let distance : String = dict.value(forKey: "distance") as? String {
            self.distance = distance
        }
        
        if let make : String = dict.value(forKey: "make") as? String {
            self.make = make
        }
        
        if let miles : String = dict.value(forKey: "miles") as? String {
            self.miles = miles
        }
        
        if let price : String = dict.value(forKey: "price") as? String {
            self.price = price
        }
        
        if let status : String = dict.value(forKey: "status") as? String {
            self.status = status
        }
        
        if let year : String = dict.value(forKey: "year") as? String {
            self.year = year
        }
        
        if let url : String = dict.value(forKey: "shareurl") as? String,
            let shareurl : URL = URL(string: url) {
            self.shareurl = shareurl
        }
        
        if let imagelist : [String] = dict.value(forKey: "imagelist") as? [String] {
            self.imagelist = imagelist
        }
    }
}
