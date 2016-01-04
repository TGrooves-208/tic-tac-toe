//
//  ViewController.swift
//  Noughts And Crosses
//
//  Created by Gil Aguilar on 1/3/16.
//  Copyright © 2016 toplevel. All rights reserved.
//  The naming convention matters when pushing to a repo

import UIKit

class ViewController: UIViewController {
    
    //1 = noughts, 2 = crosses
    var activePlayer = 1
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    //You use the p-tags to give the winning combinations in an array of arrays
    let winningCombinations = [[0, 1 , 2], [3, 4, 5], [6, 7, 8],
                              [0, 3, 6 ], [1, 4, 7], [2, 5, 8],
                              [0, 4, 8], [2, 4, 6]]
    var gameActive = true

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var gameOverLabel: UILabel!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playAgain(sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        activePlayer = 1
        
        gameActive = true
        
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgain.hidden = true
        
        playAgain.center = CGPointMake(playAgain.center.x - 500, playAgain.center.y)
        
        var buttonToClear : UIButton
        
        for var i = 0; i < 9; i++ {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, forState: .Normal)
        }
        
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
            
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
        
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
            
            activePlayer = 2
            
        } else {
                
            sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
            
            activePlayer = 1
                
        }
            
            for combination in winningCombinations {
                
                if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) {
                    
                    gameActive = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        gameOverLabel.text = "Noughts have won!"
                        
                    } else {
                        
                        gameOverLabel.text = "Crosses have won!"
                        
                    }
                    
                    endGame()
                }
                
            }
            
            if gameActive == true {
                
                gameActive = false
                
                for buttonState in gameState {
                    
                    if buttonState == 0 {
                        
                        gameActive = true
                        
                    }
                    
                }
                
                if gameActive == false {
                    
                    gameOverLabel.text = "It's a draw!"
                    
                    endGame()
                    
                }
                
            }
        }
        
    }
    
    func endGame() {
        
        gameOverLabel.hidden = false
        playAgain.hidden = false
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 500, self.gameOverLabel.center.y)
            
            self.playAgain.center = CGPointMake(self.playAgain.center.x + 500, self.playAgain.center.y)
            
        })
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameOverLabel.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 500, gameOverLabel.center.y)
        
        playAgain.hidden = true
        
        playAgain.center = CGPointMake(playAgain.center.x - 500, playAgain.center.y)
        
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

