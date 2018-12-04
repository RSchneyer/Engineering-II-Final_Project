/*David Gonzalez & Reid Schneyer
Present the C edition of Evil High Low*/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>

void getInitials(char *inits);  /*This is the Function to Create highScore Initials*/
int getRand(); //Returns a random value between 2 and 200

int main(void){
    int random; /*Random Number generated for Game*/
    int attempts; /*Attempts at guessing the Number*/
    int allowedAttempts;/*Attempts allowed per cycle of game*/
    int guess;/*Guess you make*/
    int cycle;/*Cycle of game ie. it's what lets you keep playing*/
    int plays;/*Variable Cycle has to count to to end*/
    int enter;/*Do you wanna play again variable*/
    int score;/*Number of attempts to guess number*/
    int currentScore;/*Score you currently have as of that point in the game*/
    int highScore;/*Lowest number achieved in a game cycle*/

    char userName[4];

    srand(time(NULL));
    attempts = 0;
    cycle = 0;
    plays = 1;
    score = 0;
    currentScore = 0;
    allowedAttempts = 10;

    while(cycle<plays){ /*This is the Main Loop That runs the Game, Please do not destroy*/
        random = getRand();
        
        if(attempts == 0){
            printf("Thinking of a # between 2 and 200...\n");
        } 
        else if(attempts > 0){
            printf("Too many guesses new number selected between 2 and 200!\n");
            allowedAttempts = 10 + (2*cycle);
            printf("I'm giving you %d attempts this time.\n",allowedAttempts);
        }

        for(attempts = 0; attempts < allowedAttempts; attempts++){ //Main guessing loop, while guess count is under reset num
            printf("Whats your guess: \n");
            scanf("%d", &guess);
            score = 1 + attempts;
            if(guess<random){
                if(guess >= 2){
                    printf("Too Low Idiot!\n\n");
                }
                else if(guess < 2) {
                    printf("That's Not even within my bounds stupid!\n\n");
                }
            }
            else if(guess>random){
                if(guess <= 200) {
                    printf("Too High Idiot!\n\n");
                }
                else if(guess > 200){
                    printf("That's Not even within my bounds stupid!\n\n");
                }
            }
            else if(guess==random) {
                printf("Damn you got it!\n\n");
                attempts = allowedAttempts;
            }
        }
    //Logic that runs after n guesses    
    if(guess==random){ //They guessed the correct number in n guesses
        currentScore = score + currentScore;
        if(currentScore <= highScore){ //They set the new high score
            highScore = currentScore;
            printf("highScore %d\n",highScore);
            getInitials(userName);
        }
        else if(currentScore > highScore){//They didn't set the new high score
            printf("Scored Earned %d\n",currentScore);
            printf("Highest Score Achieved %d by %.3s\n",highScore,userName);
        }
        printf("Do you wanna play again.\n1 for Yes.\nAny other number for No.\n\n");
        scanf("%d", &enter);
        if(enter == 1) {//They wanna play again
            printf("Here we go again!!\n\n");
            plays = cycle + 2;
            attempts = 0;
            currentScore = 0;
        }
        else {//They don't want to play again
            printf("Scored Earned %d\n",currentScore);
            printf("Highest Score Achieved %d by %.3s\n",highScore,userName);
            printf("It was nice knowing ya!\n");
            cycle = plays;
        }
    }
    /*
    They still haven't guessed the right number after n guesses, print score and reset to top of loop
    so that they get more guess chances and the randomNum is reset
    */
    else if (guess != random){ 
        plays = cycle + 2;
        currentScore = score + currentScore;
        printf("Current Score: %d\n",currentScore);
    }
    cycle++;
    }
return 0;
}

void getInitials(char *inits) {
    printf("Enter Initials: ");
    scanf("%s",inits);
}

int getRand(){
    return (rand()%198)+2;
}