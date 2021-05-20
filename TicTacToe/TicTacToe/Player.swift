//
//  Player.swift
//  TicTacToe
//
//  Created by Mouldi GABSI on 20/05/2021.
//

import UIKit

enum Player : String {
    case X = "x"
    case O = "o"
    
    func other() -> Player {
        switch (self) {
        case .O: return .X
        case .X: return .O
        }
    }
    
    func image() -> UIImage {
        return UIImage(named: self.rawValue + ".png")!
    }
    
    func color() -> UIColor {
        switch (self) {
        case .O: return .red
        case .X: return .black
        }
    }
    
    static func first() -> Player {
        return .X
    }
    
}

extension Player : CustomStringConvertible {
    var description: String {
        return self.rawValue.uppercased()
    }
}
