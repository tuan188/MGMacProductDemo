//
//  MainViewController.swift
//  MGMacProductDemo
//
//  Created by Tuan Truong on 1/24/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    
    weak var window: NSWindow!
    
    var productService: ProductServiceProtocol = ProductService()
    
    var products: [Product]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        tableView.setDataSource(self)
        tableView.setDelegate(self)
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        fetchProduct()
    }
    
    private func fetchProduct() {
        products = productService.getAll()
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "sheetProduct" {
            let controller = segue.destinationController as! ProductViewController
            controller.delegate = self
            controller.product = sender as? Product
        }
    }
}

extension MainViewController: NSTableViewDataSource {
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return products?.count ?? 0
    }
}

extension MainViewController: NSTableViewDelegate {
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        var view: NSTableCellView?
        
        let product = products[row]
        
        if tableColumn?.identifier == "NameColumn" {
            view = tableView.makeViewWithIdentifier("NameCell", owner: self) as? NSTableCellView
            view?.textField?.stringValue = product.name
        }
        else if tableColumn?.identifier == "PriceColumn" {
            view = tableView.makeViewWithIdentifier("PriceCell", owner: self) as? NSTableCellView
            view?.textField?.stringValue = "\(product.price)"
        }
        
        return view
    }
}

extension MainViewController: MainWindowControllerDelegate {
    func mainWindowControllerClickedAddButton() {
        self.performSegueWithIdentifier("sheetProduct", sender: nil)
    }
    
    func mainWindowControllerClickedDeleteButton() {
        let selectedRow = tableView.selectedRow
        if selectedRow >= 0 && selectedRow < products.count {
            let product = products[selectedRow]
            
            let alert = NSAlert()
            
            alert.messageText = "Are you sure you want to delete product: " + product.name
            alert.informativeText = "You can't undo this action."
            alert.addButtonWithTitle("Delete")
            alert.addButtonWithTitle("Cancel")
            alert.alertStyle = NSAlertStyle.WarningAlertStyle
            
            alert.beginSheetModalForWindow(self.window!, completionHandler: { (response) -> Void in
                if response == NSAlertFirstButtonReturn {
                    self.productService.deleteProduct(product)
                    self.fetchProduct()
                }
            })
        }
    }
    
    func mainWindowControllerClickedEditButton() {
        let selectedRow = tableView.selectedRow
        if selectedRow >= 0 && selectedRow < products.count {
            let product = products[selectedRow]
            
            self.performSegueWithIdentifier("sheetProduct", sender: product)
        }
    }
}

extension MainViewController: ProductViewControllerDelegate {
    func productViewControllerDone(sender: ProductViewController) {
        let product = sender.product
        product.modificationDate = NSDate()
        
        if product.id == "" {
            product.id = NSUUID().UUIDString
            product.creationDate = NSDate()
            productService.addProduct(product)
        }
        else {
            productService.updateProduct(product)
        }
        fetchProduct()
    }
}





