//
//  MainWindowController.swift
//  MGMacProductDemo
//
//  Created by Tuan Truong on 1/22/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import Cocoa

protocol MainWindowControllerDelegate: class {
    func mainWindowControllerClickedAddButton()
    func mainWindowControllerClickedDeleteButton()
    func mainWindowControllerClickedEditButton()
}

class MainWindowController: NSWindowController {
    
    weak var delegate: MainWindowControllerDelegate?

    override func windowDidLoad() {
        super.windowDidLoad()
        
        MagicalRecord.setupAutoMigratingCoreDataStack()
        
        window?.titleVisibility = NSWindowTitleVisibility.Hidden
        
        let mainViewController = self.contentViewController as? MainViewController
        mainViewController?.window = self.window
        self.delegate = mainViewController
    }
    
    @IBAction func onAddButtonClicked(sender: NSToolbarItem) {
        delegate?.mainWindowControllerClickedAddButton()
    }
    
    @IBAction func onDeleteButtonClicked(sender: NSToolbarItem) {
        delegate?.mainWindowControllerClickedDeleteButton()
    }
    
    @IBAction func onEditButtonClicked(sender: NSToolbarItem) {
        delegate?.mainWindowControllerClickedEditButton()
    }
    

}
