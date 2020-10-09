//
//  NumberingGame.swift
//  TaskNumberingGame
//
//  Created by Ivan Simunovic on 09/10/2020.
//

import Foundation

class NumberingGame{
    let maxNumber = 50
    
    var players: Int
    var skipNumber: Int
    var changeDirectionNumber: Int
    
    init(players: Int, skipNumber: Int, changeDirectionNumber: Int) {
        self.players = players
        self.skipNumber = skipNumber
        self.changeDirectionNumber = changeDirectionNumber
    }
    
    func playGame() -> Array<Int> {
        var arr: Array<Int> = []
        var currentNumber  = 1, currentPlayer = 1, skipped = 0, directionChanged = 0
        var direction = true
        while( true ){
            //game ended if currentNumber == maxNumber to which is played
            if(currentNumber == maxNumber){
                break;
            }

            //currentNumber == number which players skio
            if(currentNumber == self.skipNumber && direction){
                currentNumber += 1
                currentPlayer += 1
                skipped += 1
                if(currentPlayer > players){
                    currentPlayer = 1
                }
                else if(currentPlayer < 0){
                    currentPlayer = players
                }
            }
            else if(currentNumber == self.skipNumber && !direction){
                currentNumber += 1
                currentPlayer -= 1
                skipped += 1
                if(currentPlayer > players){
                    currentPlayer = 1
                }
                else if(currentPlayer < 0){
                    currentPlayer = players
                }
            }
            
            //curentNumber == number which when said changes direction
            if(currentNumber == self.changeDirectionNumber && direction ){
                currentNumber += 1
                currentPlayer -= 1
                directionChanged += 1
                direction = !direction
                if(currentPlayer > players){
                    currentPlayer = 1
                }
                else if(currentPlayer < 0){
                    currentPlayer = players
                }
            }
            else if(currentNumber == self.changeDirectionNumber && !direction){
                currentNumber += 1
                currentPlayer += 1
                directionChanged += 1
                direction = !direction
                if(currentPlayer > players){
                    currentPlayer = 1
                }
                else if(currentPlayer < 0){
                    currentPlayer = players
                }
            }
            
            if(direction){
                currentNumber += 1
                currentPlayer += 1
                if(currentPlayer > players){
                    currentPlayer = 1
                }
                else if(currentPlayer < 0){
                    currentPlayer = players
                }
            }
            else{
                currentNumber += 1
                currentPlayer -= 1
                if(currentPlayer > players){
                    currentPlayer = 1
                }
                else if(currentPlayer < 0){
                    currentPlayer = players
                }
            }
        }
        arr.append(currentPlayer)
        arr.append(skipped)
        arr.append(directionChanged)
        return arr

    }
}
