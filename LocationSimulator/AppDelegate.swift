//
//  AppDelegate.swift
//  LocationSimulator
//
//  Created by David Klopp on 18.08.19.
//  Copyright © 2019 David Klopp. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    /// The toolbar controller instance to handle the toolbar validation as well as the toolbar actions.
    @IBOutlet var menubarController: MenubarController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Most likely the logger is already initialized in SimulatorDevice. Just to be sure, check again
        FileManager.default.initLogger()
        // Register all the default setting values for this application.
        let defaults = UserDefaults.standard
        defaults.registerGeneralDefaultValues()
        defaults.registerNetworkDefaultValues()
        defaults.registerRecentLocationDefaultValues()
        defaults.registerDeveloperDiskImagesDefaultValues()
        // Load the recent locations after the app finished launching.
        self.menubarController.loadDefaults()
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
