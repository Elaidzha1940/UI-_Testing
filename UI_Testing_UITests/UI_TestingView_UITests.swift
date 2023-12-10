//  /*
//
//  Project: UI_Testing_UITests
//  File: UI_TestingView_UITests.swift
//  Created by: Elaidzha Shchukin
//  Date: 09.12.2023
//
//  */

import XCTest

// Naming Structure: test_Unit_OfWork_State_Under_Test_ExpectedBehavior
// Naming Structure: test_[struct]_[ui component]_[expected result]
// Testing Structure: Given, When, Then

final class UI_TestingView_UITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
//        continueAfterFailure = false
//        app.launch()
    }

    override func tearDownWithError() throws {
        
    }
    
    func test_UI_TestingView_saveButton_shoudNotSaveIt() {
        
    }
    
    func test_UI_TestingView_saveButton_shoudSaveIt() {
        
        app.textFields["Add an item..."].tap()
        //app.buttons["Next keyboard"].tap()
        
        app/*@START_MENU_TOKEN@*/.keys["E"]/*[[".keyboards.keys[\"E\"]",".keys[\"E\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        eKey.tap()
        eKey.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Save"].tap()
        app.navigationBars["Welcome to the store"].staticTexts["Welcome to the store"].tap()
                        
    }

}
