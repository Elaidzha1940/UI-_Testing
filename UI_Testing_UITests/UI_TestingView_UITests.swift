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
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func test_UI_TestingView_saveButton_shoudNotSaveIt() {
        // Given
        let textfield = app.textFields["SaveTextField"]
        
        // When
        textfield.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let saveButton = app.buttons["SaveButton"]
        saveButton.tap()
        
        let navBar =  app.navigationBars["Welcome to the store"]
        
        // Then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_UI_TestingView_saveButton_shoudSaveIt() {
        // Given
        let textfield = app.textFields["SaveTextField"]
        
        // When
        textfield.tap()
        
        let keyE = app.keys["E"]
        keyE.tap()
        let keye = app.keys["e"]
        keye.tap()
        keye.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let saveButton = app.buttons["SaveButton"]
        saveButton.tap()
        
        let navBar =  app.navigationBars["Welcome to the store"]
        
        // Then
        XCTAssertTrue(navBar.exists)
    }
    
    func test_SavedHomeView_showAlertButton_shouldDisplayAlert() {
        // Given
        let textfield = app.textFields["SaveTextField"]
        
        // When
        textfield.tap()
        
        let keyE = app.keys["E"]
        keyE.tap()
        let keye = app.keys["e"]
        keye.tap()
        keye.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let saveButton = app.buttons["SaveButton"]
        saveButton.tap()
        
        let navBar =  app.navigationBars["Welcome to the store"]
        XCTAssertTrue(navBar.exists)
        
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        
        // Then
        XCTAssertTrue(alert.exists)
    }
    
    func test_SavedHomeView_showAlertButton_shouldDisplayAndDismissAlert() {
        // Given
        let textfield = app.textFields["SaveTextField"]
        
        // When
        textfield.tap()
        
        let keyE = app.keys["E"]
        keyE.tap()
        let keye = app.keys["e"]
        keye.tap()
        keye.tap()
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let saveButton = app.buttons["SaveButton"]
        saveButton.tap()
        
        let navBar =  app.navigationBars["Welcome to the store"]
        XCTAssertTrue(navBar.exists)
        
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)

        let alertOKButton = alert.buttons["OK"]
        //XCTAssertTrue(alertOKButton.exists)
        
        //sleep(1)
        let alertOKButtonExists = alertOKButton.waitForExistence(timeout: 5)
        XCTAssertTrue(alertOKButtonExists)
        
        alertOKButton.tap()
        
        //sleep(1)
        let alertExists = alert.waitForExistence(timeout: 5)
    
        // Then
        XCTAssertFalse(alertExists)
        XCTAssertFalse(alert.exists)
    }
    
    func test_SavedHomeView_navigationLinkToDestination_shouldNavigateToDestination() {
        
    }
    
    func test_SavedHomeView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack() {
        
        let app = app2
        app/*@START_MENU_TOKEN@*/.textFields["SaveTextField"]/*[[".textFields[\"Add an item here...\"]",".textFields[\"SaveTextField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.keys["E"]/*[[".keyboards.keys[\"E\"]",".keys[\"E\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let eKey = app2/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        eKey.tap()
        eKey.tap()
        eKey.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["SaveButton"]/*[[".buttons[\"Save\"]",".buttons[\"SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["NavigationLinkToDestination"]/*[[".buttons[\"Navigate\"]",".buttons[\"NavigationLinkToDestination\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["Destination"].tap()
        app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Welcome to the store"].tap()
        app.navigationBars["Welcome to the store"].staticTexts["Welcome to the store"].tap()
                 
    }
}
