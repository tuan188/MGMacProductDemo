//
//  Product.swift
//  MGMacProductDemo
//
//  Created by Tuan Truong on 1/21/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import Cocoa

class Product {
    var id = NSUUID().UUIDString
    var creationDate = NSDate()
    var modificationDate = NSDate()
    var name = ""
    var price = 0.0
}
