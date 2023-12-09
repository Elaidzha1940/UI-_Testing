//  /*
//
//  Project: UI_Testing
//  File: UI_TestingView.swift
//  Created by: Elaidzha Shchukin
//  Date: 09.12.2023
//
//  */

import SwiftUI

// UI Test
/*
 1. UI Tests
 - tests the UI of the app
 
 2. Unit Tests
 - tests the business logic in the app
 */

struct UI_TestingView: View {
    var body: some View {
        
        VStack {
            LinearGradient(colors: [Color.white, Color.black],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    UI_TestingView()
}
