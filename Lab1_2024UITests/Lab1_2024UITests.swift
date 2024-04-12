//
//  Lab1_2024UITests.swift
//  Lab1_2024UITests
//
//  Created by IMD 224 on 2024-01-24.
//

import XCTest

final class Lab1_2024UITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCharCount() throws {
        let app = XCUIApplication()
        app.launch()
        
        let del: Int = app.collectionViews.buttons.count
        for _ in 0..<del
        {
            app.collectionViews.buttons.firstMatch.swipeLeft(velocity: .slow)
            app.collectionViews.buttons["Delete"].tap()
        }
        app.navigationBars["Inventory"].buttons["PlusButton"].tap()
        
        app.collectionViews.buttons.firstMatch.tap()
        let detailText = app.staticTexts["DetailText"]
        XCTAssertEqual(detailText.label, "7/100")
        
        let detailTextEditor = app.textViews["DetailTextEditor"]
        XCTAssertEqual(detailTextEditor.value as! String, "Ladybug")
        
        //let detailTextEditor = app.textViews["DetailTextEditor"]
        detailTextEditor.tap()
        
        //let keyH = app.keys["H"]
        detailTextEditor.typeText("H")
        //keyH.tap()
        XCTAssertTrue(detailText.waitForExistence(timeout: 5))
        XCTAssertEqual(detailText.label, "8/100")
        //let keyi = app.keys["i"]
        //keyi.tap()
        detailTextEditor.typeText("i")
        XCTAssertEqual(detailText.label, "9/100")
    }
    
    func testCharMax() throws {
        let app = XCUIApplication()
        app.launch()
        let del: Int = app.collectionViews.buttons.count
        for _ in 0..<del
        {
            app.collectionViews.buttons.firstMatch.swipeLeft(velocity: .slow)
            app.collectionViews.buttons["Delete"].tap()
        }
        app.navigationBars["Inventory"].buttons["PlusButton"].tap()
                
        app.collectionViews.buttons.firstMatch.tap()
        let detailText = app.staticTexts["DetailText"]
        XCTAssertEqual(detailText.label, "7/100")
        
        let detailTextEditor = app.textViews["DetailTextEditor"]
        detailTextEditor.tap()
        detailTextEditor.typeText("H")
//        let keyH = app.keys["h"]
//        keyH.tap()
        XCTAssertTrue(detailText.waitForExistence(timeout: 5))
        XCTAssertEqual(detailText.label, "8/100")
        let keyi = app.keys["o"]
        for _ in 1...99 {
            detailTextEditor.typeText("o")
            //keyi.tap()
        }
        XCTAssertEqual(detailText.label, "100/100")
        for _ in 1...5 {
           // keyi.tap()
            detailTextEditor.typeText("o")
        }
        XCTAssertEqual(detailText.label, "100/100")
    }
    
    // Continue tomorrow
    func testThird() throws {
        let app = XCUIApplication()
        app.launch()
        let del: Int = app.collectionViews.buttons.count
        for _ in 0..<del
        {
            app.collectionViews.buttons.firstMatch.swipeLeft(velocity: .slow)
            app.collectionViews.buttons["Delete"].tap()
        }
        app.navigationBars["Inventory"].buttons["PlusButton"].tap()
        
        app.collectionViews.buttons.firstMatch.tap()
        //let backButton = app.buttons["Back"]
        let backButton = app.buttons["Inventory"]
        backButton.tap()
        app.navigationBars["Inventory"].buttons["PlusButton"].tap()
        let numberItem = app.collectionViews.buttons.count
        XCTAssertEqual(app.collectionViews.buttons.count, 2)
        app.buttons["NavigatorButton"].tap()
        for _ in 1...15 {
            app.steppers["MaxCountStepper"].buttons["MaxCountStepper-Decrement"].tap()
        }
        app.terminate()
        
        app.launch()
        app.collectionViews.buttons.firstMatch.tap()
        let detailText = app.staticTexts["DetailText"]
        XCTAssertEqual(detailText.label, "7/10")
        let detailTextEditor = app.textViews["DetailTextEditor"]
        detailTextEditor.tap()
        //let keyH = app.keys["H"]
        //keyH.tap()
        detailTextEditor.typeText("o")
        
        let keyR = app.keys["r"]
        for _ in 1...12 {
            detailTextEditor.typeText("o")
            //keyR.tap()
        }
        XCTAssertEqual(detailText.label, "10/10")
        backButton.tap()
        XCTAssertEqual(app.collectionViews.buttons.count, 2)
        //app.collectionViews.buttons.firstMatch.tap()
        app.buttons["NavigatorButton"].tap()
        for _ in 2...10 {
            app.steppers["MaxCountStepper"].buttons["MaxCountStepper-Increment"].tap()
        }
    }
    
    func testFour() throws {
        let app = XCUIApplication()
        app.launch()
        let del: Int = app.collectionViews.buttons.count
        for _ in 0..<del
        {
            app.collectionViews.buttons.firstMatch.swipeLeft(velocity: .slow)
            app.collectionViews.buttons["Delete"].tap()
        }
        app.navigationBars["Inventory"].buttons["PlusButton"].tap()
        app.navigationBars["Inventory"].buttons["PlusButton"].tap()
        
        app.collectionViews.buttons.firstMatch.tap()
        let favouriteToggle = app.switches["FavoutireToggle"].switches.firstMatch
        favouriteToggle.tap()
        XCTAssertEqual(favouriteToggle.value as? String, "1") // 1 == enabled
        //let backButton = app.buttons["Back"]
        let backButton = app.buttons["Inventory"]
        backButton.tap()
        let secondEntry = app.collectionViews.buttons.element(boundBy: 1)
        secondEntry.tap()
        XCTAssertEqual(favouriteToggle.value as? String, "0") // 1 == enabled
    }
    
    func testDelete() throws {
        let app = XCUIApplication()
        app.launch()
        let del: Int = app.collectionViews.buttons.count
        for _ in 0..<del
        {
            app.collectionViews.buttons.firstMatch.swipeLeft(velocity: .slow)
            app.collectionViews.buttons["Delete"].tap()
        }
        app.navigationBars["Inventory"].buttons["PlusButton"].tap()
        
        app.collectionViews.buttons.firstMatch.tap()
        let backButton = app.buttons["Inventory"]
        backButton.tap()
        app.navigationBars["Inventory"].buttons["PlusButton"].tap()
        app.collectionViews.buttons.firstMatch.swipeLeft(velocity: .slow)
        app.collectionViews.buttons["Delete"].tap()
        XCTAssertEqual(app.collectionViews.buttons.count, 1)
    }
    
}
