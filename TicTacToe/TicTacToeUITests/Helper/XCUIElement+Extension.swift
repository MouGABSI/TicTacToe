//
//  XCUIElement+Extension.swift
//  TicTacToeUITests
//
//  Created by Mouldi GABSI on 18/05/2021.
//

import XCTest

extension XCUIElement {
    // a function that return visibility of the UIElement in the screen
    func visible() -> Bool {
        
        guard self.exists && !self.frame.isEmpty else { return false }

        let elementOriginY = round(self.frame.origin.y)
        let elementHeight  = round(self.frame.size.height)
        let windowHeight = XCUIApplication().windows.element(boundBy:0).frame.size.height
        return (windowHeight >= (elementHeight + elementOriginY))
    }
}
