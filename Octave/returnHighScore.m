function highScore = returnHighScore(potentialHighScore, currentHighScore)
    if(potentialHighScore<currentHighScore)
        highScore = potentialHighScore;
    else
        highScore = currentHighScore;
    end
end