//
//  TicTacToeTests.swift
//  TicTacToeTests
//
//  Created by Mouldi GABSI on 18/05/2021.
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCheckForWinner() throws {
        // Test that check winner returns the winner player
        let homeViewController = ViewController()
        homeViewController.gameBoard = [.X, .O, .X,
                                        .O, .X, .O,
                                        .X, .O, .X]
        let winner = homeViewController.checkForWinner()
        
        XCTAssertEqual(winner, .X, "The player X should be the winner")
    }
    
    func testDrawGame() throws {
        // Test that check winner returns the winner player
        let homeViewController = ViewController()
        homeViewController.gameBoard = [.X, .O, nil,
                                        .X, .X, .O,
                                        .O, .X, .O]
        let winner = homeViewController.checkForWinner()
        
        XCTAssertNil(winner, "There is no winner the game is draw")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
