//
//  Mapper.swift
//  MGMacProductDemo
//
//  Created by Tuan Truong on 1/21/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import Cocoa

class Mapper {
    var id = NSUUID().UUIDString
    var creationDate = NSDate()
    var modificationDate = NSDate()
    var name = ""
    var price = 0.0
    
    class func mapProduct(product: Product, fromProductEntity productEntity: ProductEntity) {
        product.id = productEntity.id ?? ""
        product.creationDate = productEntity.creationDate ?? NSDate()
        product.modificationDate = productEntity.modificationDate ?? NSDate()
        product.name = productEntity.name ?? ""
        product.price = productEntity.price?.doubleValue ?? 0
    }
    
    class func mapProductEntity(productEntity: ProductEntity, fromProduct product: Product) {
        productEntity.id = product.id
        productEntity.creationDate = product.creationDate
        productEntity.modificationDate = product.modificationDate
        productEntity.name = product.name
        productEntity.price = product.price
    }
    
    class func productFromProductEntity(productEntity: ProductEntity) -> Product {
        let product = Product()
        mapProduct(product, fromProductEntity: productEntity)
        return product
    }
}
