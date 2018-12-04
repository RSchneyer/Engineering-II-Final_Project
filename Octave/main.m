% Reid and David
% Engineering II Final Project
% "Evil" high-low game
% 11/29/2018


% Initialize variables
highScore = realmax;   % Initialize highscore as max int(?) value, so that the first highscore HAS to be lower
stillPlaying = true;   % Flag var for if user has decided to end the program
gameOver = false;      % Flag var that gets changed when user has guessed target number
firstGame = true;      % Flag var for if current game is first run game, used for setting highscore
guessCounter = 0;      % Amount of incorrect guesses, resets on new game
guessCountTarget = 10; % Initial amount of incorrect guesses until target number gets reset
resetCount = 0;        % Amount of times the target number has been reset
playAgain = 0;         % Used for input to continue playing after user has finished game
userName = "AAA";

% Initialize target number
targetNum = randGen();
% stillPlaying is true while user hasn't finished their first game, or if they select 1 after finishing a game
while(stillPlaying)
    dispNumAndString("Target num is: ", targetNum);
    % gameOver is false while the user hasn't guessed the correct number
    while(!gameOver)
        userGuess = input("Guess the random number (between 2 an 200): ");
        if(checkGuess(userGuess, targetNum))
            % User guessed the correct number, reset flags and print guess count
            guessCounter++;
            gameOver = true;
            dispNumAndString("Guess count: ", guessCounter);
            firstGame = false;
        else
            % User didn't guess the correct number, increment guessCounter
            guessCounter++;
        end
        % Reset guessTarget after n guesses
        if(guessCounter == guessCountTarget)
            resetCount++;
            targetNum = randGen();
            dispNumAndString("New Target num is: ", targetNum);
            guessCountTarget += (resetCount*2)+10;
        end
    end
    
    % Check if latest score is the new high score, and set the high score accordingly
    if(guessCounter<=highScore)
        userName = getInitials();
    end
    highScore  = returnHighScore(guessCounter, highScore);
    
    % Ask if user wants to play again
    % Octave has this shit built in
    playAgain = yes_or_no("Do you wanna play again?");
    
    if(playAgain ~= 1)
        % User doesn't want to play again, print high score, and set playAgain to false to exit outer while loop
        stillPlaying = false;
        dispNumAndString("High score was: ", highScore, " set by ", userName);
	disp("It was nice knowing ya!");
    else
        % User wants to play again, reset appropriate variables
        disp("Here we go again!!\n\n");
        gameOver = false;
        guessCountTarget = 10;
        guessCounter = 0;
        resetCount = 0;
        playAgain = 0;
        targetNum = randGen();
    end
end
