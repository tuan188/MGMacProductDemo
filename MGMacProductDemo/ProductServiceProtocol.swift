//
//  ProductServiceProtocol.swift
//  MGMacProductDemo
//
//  Created by Tuan Truong on 1/23/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import Cocoa

protocol ProductServiceProtocol {
    func getAll() -> [Product]
    func addProduct(product: Product)
    func updateProduct(product: Product)
    func deleteProduct(product: Product)
}
