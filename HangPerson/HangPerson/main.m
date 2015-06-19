//
//  main.m
//  HangPerson
//
//  Created by Michael Kavouras on 6/15/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //        I would like to add the option of playing again
        //        Some other words:
        //        Coconut
        //        Tropical
        //        Strawberry
        
        //I would also like to add a maximum number of guesses
        
        
        char guessedLetter;
        char secretWord1[7] = "unicorn";
        char blankSpaces1[7] = "_______";
        
        int secretWord1Length = sizeof(secretWord1) / sizeof(char);
        
        
        printf ("Let's play hangperson!\n\n");
        
        
        int wordComplete = 0;
        
        while(true) {
            
            //print current state of blank spaces
            for (int k = 0; k < secretWord1Length; k++) {
                printf("%c ", blankSpaces1[k]);
            }
            
            // if all letters have been guessed. Game has been won.
            if (wordComplete == 1){
                printf("\n\nYou're awesome. You got it.");
                break;
            }
            
            //print prompt, scan for user input
            printf("\n\nGuess a letter:");
            scanf("%c", &guessedLetter);
            
            //set an integer to declare if any matches are found between the user's input and the secret word
            int matches = 0;
            wordComplete = 1;
            
            //compare user input to secret word, compare secret word to the current state of blank spaces
            for (int i = 0; i < secretWord1Length; i++) {
                
                if (guessedLetter == secretWord1[i]){
                    blankSpaces1[i] = guessedLetter;
                    matches = 1;
                }
                if (blankSpaces1[i] != secretWord1[i]){
                    wordComplete = 0;
                }
            }
            
            if (matches == 1){
                printf("\nNice!\n");
            }
            
            if (matches == 0){
                printf("\nSorry, no '%c'\n\n", guessedLetter);
            }
            
            
            scanf("%c", &guessedLetter);
        }
        
        
        
        
    }
    return 0;
}
