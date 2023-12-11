//  /*
//
//  Project: UI_Testing
//  File: UI_TestingApp.swift
//  Created by: Elaidzha Shchukin
//  Date: 09.12.2023
//
//  */

import SwiftUI

@main
struct UI_TestingApp: App {
    
    init() {
        
        let itemIsSaved: Bool = CommandLine.arguments.contains("-UITest_startSaving") ? true : false
       print("ITEM IS SAVED \(itemIsSaved)")
    }
    
    var body: some Scene {
        WindowGroup {
            UI_TestingView()
        }
    }
}
