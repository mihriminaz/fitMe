//
//  ShoesObject.swift
//  fitMe
//
//  Created by Mihri on 07/07/15.
//  Copyright (c) 2015 Minaz. All rights reserved.
//

import Foundation

class ShoesObject : NSObject {
    var brand: String?
    var image: String?
    var price: Double?
    var size: String?
    var available: Bool!
    var isBought: Bool!
    var isFit: Bool!
    
    init(brand: String, image: String, price: Double, size: String, available: Bool, isBought: Bool, isFit: Bool) {
        self.brand = brand
        self.image = image
        self.price = price
        self.size = size
        self.available = available
        self.isBought = isBought
        self.isFit = isFit
        
        super.init()
    }
    
    class func fromJSON(json: [String:JSONValue]) -> ShoesObject? {

        let brand = json["brand"]?.string
        let image = json["image"]?.string
        let price = json["price"]?.double
        let size = json["size"]?.string
        let available = json["available"]?.bool
        let isBought = json["isBought"]?.bool
        let isFit = json["isFit"]?.bool
        
        return ShoesObject(brand: brand!, image: image!, price: price!, size: size!, available: available!, isBought: isBought!, isFit: isFit!)
    }
}