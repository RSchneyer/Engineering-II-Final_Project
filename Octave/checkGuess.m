% Simple function that compares two numerical arguments, and returns true if they're equal, and false otherwise
% Additionally, it displays a message to the user if their guess is too high or too low
function correctGuess = checkGuess(guessNum, targetNum)
    correctGuess = false;
    if(guessNum>200|| guessNum<2)
        disp("That's Not even within my bounds stupid!\n");
    end
    if(guessNum>targetNum)
        disp("Too High Idiot!\n");
    else if(guessNum<targetNum)
        disp("Too Low Idiot!\n");
    else
        disp("Damn you  got it!\n");
        correctGuess = true;
    end
end