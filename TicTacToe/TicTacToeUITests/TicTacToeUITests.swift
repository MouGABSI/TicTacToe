//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Mouldi GABSI on 18/05/2021.
//

import XCTest

class TicTacToeUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUIElementsExistAndAreVisibles() throws {
        // UI tests must launch the application that they test.
        
        let titleLabel  = app.navigationBars.staticTexts["Tic Tac Toe"]
        let winnerLabel = app.staticTexts["winner_label"]
        let button0     = app.buttons["0_0"]
        let button1     = app.buttons["0_1"]
        let button2     = app.buttons["0_2"]
        let button3     = app.buttons["1_0"]
        let button4     = app.buttons["1_1"]
        let button5     = app.buttons["1_2"]
        let button6     = app.buttons["2_0"]
        let button7     = app.buttons["2_1"]
        let button8     = app.buttons["2_2"]
        
        XCTAssertTrue(titleLabel.exists, "Title Label should exist")
        XCTAssertTrue(winnerLabel.exists, "Winner Label should exist")
        XCTAssertTrue(button0.exists, "button in row 0 colomn 0 should exist")
        XCTAssertTrue(button1.exists, "button in row 0 colomn 1 should exist")
        XCTAssertTrue(button2.exists, "button in row 0 colomn 2 should exist")
        XCTAssertTrue(button3.exists, "button in row 1 colomn 0 should exist")
        XCTAssertTrue(button4.exists, "button in row 1 colomn 1 should exist")
        XCTAssertTrue(button5.exists, "button in row 1 colomn 2 should exist")
        XCTAssertTrue(button6.exists, "button in row 2 colomn 0 should exist")
        XCTAssertTrue(button7.exists, "button in row 2 colomn 1 should exist")
        XCTAssertTrue(button8.exists, "button in row 2 colomn 2 should exist")
        
        XCTAssertTrue(titleLabel.visible(), "Title Label should be visible")
        XCTAssertFalse(winnerLabel.visible(), "Winner Label should not be visible")
        XCTAssertTrue(button0.visible(), "button in row 0 colomn 0 should be visible")
        XCTAssertTrue(button1.visible(), "button in row 0 colomn 1 should be visible")
        XCTAssertTrue(button2.visible(), "button in row 0 colomn 2 should be visible")
        XCTAssertTrue(button3.visible(), "button in row 1 colomn 0 should be visible")
        XCTAssertTrue(button4.visible(), "button in row 1 colomn 1 should be visible")
        XCTAssertTrue(button5.visible(), "button in row 1 colomn 2 should be visible")
        XCTAssertTrue(button6.visible(), "button in row 2 colomn 0 should be visible")
        XCTAssertTrue(button7.visible(), "button in row 2 colomn 1 should be visible")
        XCTAssertTrue(button8.visible(), "button in row 2 colomn 2 should be visible")
        
        
    }
    
    func testThatPlayerXShouldStartTheGame() {
        //Get random button to start the game
        let randomRow    = Int.random(in: 0...2)
        let randomColomn = Int.random(in: 0...2)
        let randomStartButton = app.buttons["\(randomRow)_\(randomColomn)"]
        XCTAssertTrue(randomStartButton.exists, "start button should exist")
        XCTAssertTrue(randomStartButton.visible(), "start button should be visible")
        randomStartButton.tap()
        XCTAssertTrue(app.buttons["X"].exists, "the first clicked button background image should be X")
        XCTAssertTrue(app.buttons["X"].visible(), "the first clicked button background image should be X")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
