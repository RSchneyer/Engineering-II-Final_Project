% Reid and David

highScore = realmax;
stillPlaying = true;
gameOver = false;
newGame = true;
guessCounter = 0;
guessCountTarget = 10;
resetCount = 0;
playAgain = 0;

targetNum = randGen();


while(stillPlaying)
    dispNumAndString("Target num is: ", targetNum);
    while(!gameOver)
        userGuess = input("Guess the random number: ");
        if(checkGuess(userGuess, targetNum))
            gameOver = true;
            dispNumAndString("Guess count: ", guessCounter);
            newGame = false;
        else
            guessCounter++;
        end
        if(guessCounter == guessCountTarget)
            resetCount++;
            targetNum = randGen();
            dispNumAndString("New Target num is: ", targetNum);
            guessCountTarget += (resetCount*2)+10;
        end
    end

    if(newGame)
        highScore = guessCounter;
    else
        highScore = returnHighScore(guessCounter, highScore);
    end

    playAgain = input("Press 1 to play again, or anything else to quit");
    if(playAgain ~= 1)
        stillPlaying = false;
        dispNumAndString("High score was: ", highScore);
    else
        gameOver = false;
        guessCountTarget = 10;
        guessCounter = 0;
        resetCount = 0;
        playAgain = 0;
        targetNum = randGen();
    end
    

end

% Print out high score here
% Thank user for playing 