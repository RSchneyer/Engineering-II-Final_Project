function correctGuess = checkGuess(guessNum, targetNum)
    correctGuess = false;
    if(guessNum>targetNum)
        disp("Too high, try again");
    else if(guessNum<targetNum)
        disp("Too low, try again");
    else
        disp("Correct!");
        correctGuess = true;
    end
end