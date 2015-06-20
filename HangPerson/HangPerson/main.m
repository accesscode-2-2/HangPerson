//
//  main.m
//  HangPerson
//
//  Created by Michael Kavouras on 6/15/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

// LAUREN CAPONONG HW - 06-19-15


#import <Foundation/Foundation.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //        Your job is to create a game called "Hang Person" where a user has to guess a predetermined word(s).
        //
        //        Here are the rules:
        //
        //        1. After every guess, you must print out the current state of the game. (e.g. _ _ n _ n _)
        //        2. You must determine a maximun number of wrong guesses. If the player guesses too many incorrect letters, they lose and the game ends.
        //        3. If the player looses, provide a message letting them know that they lost.
        //        4. If they win, provide a message letting them know that they won.
        
        
        
        //INITIALIZING VARIABLES
        
        char word[] = {'l', 'e', 'o', 'p', 'a', 'r', 'd'};          // array of type 'char' for the word leopard
        int maxGuesses = 7;                                         // define # of guesses possible
        char dashes[7] = {'-', '-', '-', '-', '-', '-', '-'};
        int currentGuess;
        char userGuess, letterGuess;
        int correctGuesses = 0;
        int lives = 7;
        
        
        //PRINT INTRODUCTION
        
        printf("Your word is: _ _ _ _ _ _ _ \n");
        printf("You can only guess 7 times.\n ");
        
        
        //FOR LOOP
        
        for (currentGuess = 0; currentGuess < maxGuesses; currentGuess++) {
            
            printf("\nEnter a character: ");                 // enter character
            scanf(" %c", &userGuess);                       // scanning user input
            
            
            for (letterGuess = 0; letterGuess < maxGuesses; letterGuess++)
            {
                if (userGuess == word[letterGuess]) {        // if user enters a character in one index of j,
                    dashes[letterGuess] = userGuess;      // the index of DASHES array equals to whatever the user guesses
                    correctGuesses = correctGuesses + 1;  // if user gets another correct guess add +1
                }
            }
            
            printf("Result: %s \n", dashes); // prints out the result in dashes array
            
            lives--;
            
            if (lives == 0 && correctGuesses < 7) {
                printf("\nYou lost, sorry. Try again later.");
            } else if (lives > 0) {
                printf("\nYou have %d tries left \n", lives);
            } else {
                printf("\nYou won, thanks for playing!");
            }
            //
            //
        }
    }
    
    return 0;
}