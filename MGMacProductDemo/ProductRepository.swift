//
//  ProductRepository.swift
//  MGMacProductDemo
//
//  Created by Tuan Truong on 1/23/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import Cocoa

class ProductRepository: NSObject {
    
    func getAll() -> [Product] {
        var products = [Product]()
        
        if let productEntities = ProductEntity.MR_findAllSortedBy("modificationDate", ascending: false) as? [ProductEntity] {
            for entity in productEntities {
                products.append(Mapper.productFromProductEntity(entity))
            }
        }
        
        return products
    }
    
    func addProduct(product: Product) {
        MagicalRecord.saveWithBlockAndWait { (context) -> Void in
            if let entity = ProductEntity.MR_createEntityInContext(context) {
                Mapper.mapProductEntity(entity, fromProduct: product)
            }
        }
    }
    
    func updateProduct(product: Product) {
        MagicalRecord.saveWithBlockAndWait { (context) -> Void in
            let predicate = NSPredicate(format: "id = '\(product.id)'")
            if let entity = ProductEntity.MR_findFirstWithPredicate(predicate, inContext: context) {
                entity.modificationDate = NSDate()
                Mapper.mapProductEntity(entity, fromProduct: product)
            }
        }
    }
    
    func deleteProduct(product: Product) {
        MagicalRecord.saveWithBlockAndWait { (context) -> Void in
            let predicate = NSPredicate(format: "id = '\(product.id)'")
            ProductEntity.MR_deleteAllMatchingPredicate(predicate, inContext: context)
        }
    }
}
