//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mouldi GABSI on 18/05/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    var gameBoard: [Player?] = [nil, nil, nil,
                                nil, nil, nil,
                                nil, nil, nil
    ]
    
    let winningCombos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], //horizontal
                         [0, 3, 6], [1, 4, 7], [2, 5, 8], //vertical
                         [0, 4, 8], [2, 4, 6]] //diagonals
    
    var gameOver = false
    var turnCount = 0
    var currentPlayer: Player!
    
    @IBAction func makeMove(sender: AnyObject) {
        let space = sender.tag! - 1
        if (gameBoard[space] == nil && !gameOver) {
            
            sender.setTitle(currentPlayer.description, for: .normal)
            sender.setTitleColor(currentPlayer.color(), for: .normal)
            gameBoard[space] = currentPlayer
            turnCount += 1
            
            if turnCount >= 5, let winner = checkForWinner() {
                gameOver = true
                winnerLabel.text = "\(winner) is the winner!"
                winnerLabel.isHidden = false
            } else if (turnCount == 9) {
                gameOver = true
                winnerLabel.text = "It's a tie!"
            } else {
                currentPlayer = currentPlayer.other()
            }
        }
    }
    
    func checkForWinner() -> Player? {
        for combo in winningCombos {
            let row = combo.map { gameBoard[$0] }
            if (row[0] != nil && row[0] == row[1] && row[1] == row[2]) {
                return row[0]
            }
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPlayer = .X
    }
    
    
}

