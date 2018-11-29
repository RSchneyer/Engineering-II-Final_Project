% Compares two numerical arguments, and returns the lower one
% arg1 is the latest score, and arg2 is the current running high score
function highScore = returnHighScore(potentialHighScore, currentHighScore)
    if(potentialHighScore<currentHighScore)
        highScore = potentialHighScore;
    else
        highScore = currentHighScore;
    end
end