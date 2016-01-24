//
//  AppDelegate.swift
//  MGMacProductDemo
//
//  Created by Tuan Truong on 1/20/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        MagicalRecord.cleanUp()
    }


}

