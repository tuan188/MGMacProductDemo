//
//  ProductViewController.swift
//  MGMacProductDemo
//
//  Created by Tuan Truong on 1/24/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import Cocoa

protocol ProductViewControllerDelegate: class {
    func productViewControllerDone(sender: ProductViewController)
}

class ProductViewController: NSViewController {
    
    @IBOutlet weak var nameTextField: NSTextField!
    
    @IBOutlet weak var priceTextField: NSTextField!
    
    var product: Product!
    
    weak var delegate: ProductViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if product != nil {
            nameTextField.stringValue = product.name
            priceTextField.stringValue = String(product.price)
        }
    }
    
    @IBAction func onOKButtonClicked(sender: NSButton) {
        if product == nil {
            product = Product()
        }
        
        product.name = nameTextField.stringValue
        product.price = (priceTextField.stringValue as NSString).doubleValue
        
        delegate?.productViewControllerDone(self)
        
        self.dismissController(nil)
    }
    
    @IBAction func onCancelButtonClicked(sender: NSButton) {
        self.dismissController(nil)
    }
}
