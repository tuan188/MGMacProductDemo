//
//  MainWindowController.swift
//  MGMacProductDemo
//
//  Created by Tuan Truong on 1/22/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        
        window?.titleVisibility = NSWindowTitleVisibility.Hidden
    }
    
    @IBAction func onAddButtonClicked(sender: NSToolbarItem) {
        print("add")
    }
    
    @IBAction func onDeleteButtonClicked(sender: NSToolbarItem) {
        print("delete")
    }

}
