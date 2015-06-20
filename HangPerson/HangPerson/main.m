//
//  main.c
//  Hangperson
//
//  Created by Z on 6/16/15.
//  Copyright (c) 2015 dereknetto. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h> //imports library for arc4random_uniform function
#include <unistd.h> //imports library for sleep function

int guessesLeft;

void printHangState() {
    switch (guessesLeft) {
        case 0:
            printf("\n  _______");
            printf("\n |/      |");
            printf("\n |      (_)");
            printf("\n |      ~|/");
            printf("\n |       |");
            printf("\n |      / L");
            printf("\n |"         );
            printf("\n_|___"      );
            break;
        case 1:
            printf("\n  _______");
            printf("\n |/      |");
            printf("\n |      (_)");
            printf("\n |      ~|/");
            printf("\n |       |");
            printf("\n |      /  ");
            printf("\n |"         );
            printf("\n_|___"      );
            break;
        case 2:
            printf("\n  _______");
            printf("\n |/      |");
            printf("\n |      (_)");
            printf("\n |      ~|/");
            printf("\n |       |");
            printf("\n |         ");
            printf("\n |"         );
            printf("\n_|___"      );
            break;
        case 3:
            printf("\n  _______");
            printf("\n |/      |");
            printf("\n |      (_)");
            printf("\n |      ~| ");
            printf("\n |       |");
            printf("\n |         ");
            printf("\n |"         );
            printf("\n_|___"      );
            break;
        case 4:
            printf("\n  _______");
            printf("\n |/      |");
            printf("\n |      (_)");
            printf("\n |       | ");
            printf("\n |       |");
            printf("\n |         ");
            printf("\n |"         );
            printf("\n_|___"      );
            break;
        case 5:
            printf("\n  _______");
            printf("\n |/      |");
            printf("\n |      (_)");
            printf("\n |       | ");
            printf("\n |        ");
            printf("\n |         ");
            printf("\n |"         );
            printf("\n_|___"      );
            break;
        case 6:
            printf("\n  _______");
            printf("\n |/      |");
            printf("\n |      (_)");
            printf("\n |         ");
            printf("\n |        ");
            printf("\n |         ");
            printf("\n |"         );
            printf("\n_|___"      );
            break;
        case 7:
            printf("\n  _______");
            printf("\n |/      |");
            printf("\n |        ");
            printf("\n |         ");
            printf("\n |        ");
            printf("\n |         ");
            printf("\n |"         );
            printf("\n_|___"      );
            break;
    }
}

int main(int argc, const char * argv[]) {
    
    //initializes and fills a character array that contains the word to guess
    char *wordToGuess = "samurai";
    
    //initializes an unsigned long of the value of the length of the word to guess
    int wordLength = strlen(wordToGuess);
    
    //initializes a boolean integer for the win state
    int win = 0;
    
    //initializes an integer of the guesses left
    guessesLeft = 8;
    
    //initializes an array containg the indices of characters to reveal
    int revealKeys[wordLength];
    for (int i = 0; i < wordLength; i++) {
        revealKeys[i] = 0;
    }
    
    //greets player
    printf("WELCOME TO HANGPERSON.");
    
    //GAME LOOP
    while (win == 0) {
        
        usleep(2e5); //pause before each loop
        
        int showTryAgain = 1;
        
        //prompts player to guess a letter
        char guessedLetter;
        printf("\n\nGuess a letter: ");
        scanf(" %c",&guessedLetter);
        
        for (int i = 0; i < wordLength; i++) { //for loop iterates through each character in the word to guess
            
            if (wordToGuess[i] == guessedLetter) { //checks if guessed letter is in the word to guess
                
                revealKeys[i] = 1;
                
                showTryAgain = 0;
            }
            
        }
        
        //decreases the guesses left by 1 if player guesses incorrectly
        if(showTryAgain ==1){
         guessesLeft = guessesLeft - 1;
        }
        
        //displays current hanged state
        printHangState();
        
        //displays current guessed state
        printf("\n\n");
        for (int i = 0; i < wordLength; i++) {
            if (revealKeys[i] == 1) {
                printf("%c ",wordToGuess[i]);
            }
            else {
                printf("_ ");
            }
            
        }
        
        //tells player about their progress
        if (showTryAgain == 1){ //code is executed if guessed letter incorrectly
            if (guessesLeft == 0) {
                printf("\n\nYOU ARE DEAD."); //printed when player runs out of guesses
                break; //ends game
            }
            else {
               printf("\n\nTry again. Guesses left: %d",guessesLeft); //tells player to try again
            }
            
            
        }
        else { //code executed if guessed letter is correct
            printf("\n\nCORRECT!"); //tells player that they guessed correctly
        }
        
        //checks if player has won
        win = 1;
        for (int i = 0; i <wordLength; i++) {
            if (revealKeys[i] == 0) {
                win = 0; //player has not won
            }
        }
        if (win == 1) {
            printf("\nYOU WIN!!!!! <(^_^)>");
        }
        
    }
    return 0;
}