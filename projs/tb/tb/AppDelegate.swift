//
//  AppDelegate.swift
//  tb
//
//  Created by Jz D on 2020/3/1.
//  Copyright © 2020 Jz D. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        NSApplication.shared.mainWindow?.title = "歌"
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

