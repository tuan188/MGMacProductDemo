//
//  ProductService.swift
//  MGMacProductDemo
//
//  Created by Tuan Truong on 1/23/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import Cocoa

class ProductService: NSObject, ProductServiceProtocol {
    let productRepository = ProductRepository()
    
    func getAll() -> [Product] {
        return productRepository.getAll()
    }
    
    func addProduct(product: Product) {
        productRepository.addProduct(product)
    }
    
    func updateProduct(product: Product) {
        productRepository.updateProduct(product)
    }
    
    func deleteProduct(product: Product) {
        productRepository.deleteProduct(product)
    }
}
