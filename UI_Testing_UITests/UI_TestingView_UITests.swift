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
        saveItAndSaveThat(shouldTypeOneKeyboard: false)
        
        // When
        let navBar =  app.navigationBars["Welcome"]
        
        // Then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_UI_TestingView_saveButton_shoudSaveIt() {
        // Given
        saveItAndSaveThat(shouldTypeOneKeyboard: true)

        // When
        let navBar =  app.navigationBars["Welcome to the store"]
        
        // Then
        XCTAssertTrue(navBar.exists)
    }
    
    func test_SavedHomeView_showAlertButton_shouldDisplayAlert() {
        // Given
       saveItAndSaveThat(shouldTypeOneKeyboard: true)
        
        // When
       tapAlertButton(shouldDismissAlert: false)
        
        // Then
        let alert = app.alerts.firstMatch
        XCTAssertTrue(alert.exists)
    }
    
    func tapAlertButton(shouldDismissAlert: Bool) {
        let showAlertButton = app.buttons["ShowAlertButton"]
        showAlertButton.tap()
        
        if shouldDismissAlert {
            let alert = app.alerts.firstMatch
            let alertOKButton = alert.buttons["OK"]
            
            //sleep(1)
            let alertOKButtonExists = alertOKButton.waitForExistence(timeout: 5)
            XCTAssertTrue(alertOKButtonExists)
            
            alertOKButton.tap()
        }
    }
    
    func test_SavedHomeView_showAlertButton_shouldDisplayAndDismissAlert() {
        // Given
        saveItAndSaveThat(shouldTypeOneKeyboard: true)
        
        // When
        tapAlertButton(shouldDismissAlert: true)
        
       
        
        //sleep(1)
        let alertExists = alert.waitForExistence(timeout: 5)
    
        // Then
        XCTAssertFalse(alertExists)
        XCTAssertFalse(alert.exists)
    }
    
    func test_SavedHomeView_navigationLinkToDestination_shouldNavigateToDestination() {
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
        
        let navLinkButton =  app.buttons["NavigationLinkToDestination"]
        navLinkButton.tap()
        
        let navigationText = app.staticTexts["Destination"]
        
        // Then
        XCTAssertTrue(navigationText.exists)
    }
    
    func test_SavedHomeView_navigationLinkToDestination_shouldNavigateToDestinationAndGoBack() {
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
        
        let navLinkButton =  app.buttons["NavigationLinkToDestination"]
        navLinkButton.tap()
        
        let navigationText = app.staticTexts["Destination"]
        XCTAssertTrue(navigationText.exists)

        let backButton = app.navigationBars.buttons["Welcome to the store"]
        backButton.tap()
        
        // Then
        XCTAssertTrue(navBar.exists)
    }
}

// MARK: Functions

extension UI_TestingView_UITests {
    
    func saveItAndSaveThat(shouldTypeOneKeyboard: Bool) {
        let textfield = app.textFields["SaveTextField"]
        textfield.tap()
        
        if shouldTypeOneKeyboard {
            let keyE = app.keys["E"]
            keyE.tap()
            let keye = app.keys["e"]
            keye.tap()
            keye.tap()
        }
        
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        
        let saveButton = app.buttons["SaveButton"]
        saveButton.tap()
    }
}
