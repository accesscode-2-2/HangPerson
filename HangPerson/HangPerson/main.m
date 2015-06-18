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
        
        char phrase[] = "A Penny Saved Is A Penny Earned";
        int sizeOfPhrase = sizeof(phrase)/sizeof(char);
        char alreadyGuessed[26];
        char guess[sizeOfPhrase]; //clone array for user guesses
        
        //initialize guess array
        for (int i = 0; i< sizeOfPhrase-1; i++) {
            if (phrase[i] == ' ') {
                guess[i] = ':';
            }
            else {
                guess[i] = '_';
            }
        }
        
        printf("Let's Play Hang Person! \n\n");
        
        //print guess array
        
        for (int i = 0; i<sizeOfPhrase; i++) {
            if (guess[i] == ':') {
                printf("\t");
            }
            else{
            printf("%c ", guess[i]);
            }
        }
        
        int numberOfGuesses = 5;
        int guessCount = 0;
        
        while (true) {
            BOOL guessed = YES;
            
            for (int i = 0; i<sizeOfPhrase-1; i++) {
                if (guess[i] == '_') {
                    guessed = NO;
                }
            }
            
            if (numberOfGuesses<1) {
                printf("\n\nSorry, you lost the game");
                break;
            }
            else if (guessed) {
                printf("\n\nYou won!");
                break;
            }
            else {
                char input;
                bool alreadyInGuessArray = NO;
                bool correctGuess = NO;
                printf("\n\nGuess a letter: ");
                fpurge(stdin);
                scanf("%c", &input);
                
                
                //check if they guessed this letter already
                
                for (int i = 0; i<26; i++) {
                    if (alreadyGuessed[i] == input) {
                        printf("\nYou already guessed the letter %c \n\n", input);
                        alreadyInGuessArray = YES;
                    }
                }
                
                if (!alreadyInGuessArray) {
                    alreadyGuessed[guessCount++] = input;
                    for (int i = 0 ; i<sizeOfPhrase; i++) {
                        if (phrase[i] == input || phrase[i] == toupper(input) || phrase[i] == tolower(input)) {
                            correctGuess = YES;
                            guess[i] = phrase[i];
                            
                        }
                    }
                    
                    if (!correctGuess) {
                        numberOfGuesses--;
                        printf("\nTry Again! %c is not in this phrase \n", input);
                        if(numberOfGuesses==0){
                        }
                        else {
                            printf("You have %d wrong answers left \n \n", numberOfGuesses);
                        }
                        
                    }
                    
                }
                
                for (int i = 0; i<sizeOfPhrase; i++) {
                    if (guess[i] == ':') {
                        printf("\t");
                    }
                    else{
                        printf("%c ", guess[i]);
                    }
                }
                
            }
        }
        

    }
    return 0;
}
