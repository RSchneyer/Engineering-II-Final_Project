% Simple function that compares two numerical arguments, and returns true if they're equal, and false otherwise
% Additionally, it displays a message to the user if their guess is too high or too low
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