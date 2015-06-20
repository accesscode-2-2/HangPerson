//
//  main.m
//  Hangman Homework
//
//  Created by Eric Sze on 6/14/15.
//  Copyright (c) 2015 Eric Sze. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //        Hang Person: Create a game called "Hang Person" where a user has to guess a predetermined word. Here are the rules:
        //        After every guess, you must print out the current state of the game. (e.g. _ _ n _ n _)
        //        You must determine a maximum number of wrong guesses. If the player guesses too many incorrect letters, they lose and the game ends.
        //        If the player looses, provide a message letting them know that they lost.
        //        If they win, provide a message letting them know that they won.
        
        char guessWords[][16] = {"apple", "banana", "juxtaposition", "venture", "austrailia", "monopoly", "canada", "america", "poland", "africa", "linux"};
        
        int randomIndex = arc4random() % 11;
        long lengthOfWord = strlen(guessWords[randomIndex]);
        int numLives = 5;
        int numCorrect = 0;
        int oldCorrect = 0;
        //array to keep track of letters that have been guessed already, if 1 (true/yes), letter is correct
        //                       0 1 2 3 4
        //                       g r e e n
        int letterGuessed[16];
        int loopIndex =  0;
        
        char guess[16];
        char letterEntered;
        
//        printf("guessWords: %s randomIndex:%d lengthOfWord:%ld\n", guessWords[randomIndex], randomIndex, lengthOfWord);
        printf("--------HANG-PERSON--------\n      Guess the word!\n    You have 5 chances!\n---------------------------\n\n");
        
        //game loop
        while (numCorrect < lengthOfWord) {
            
            printf("Hang-person word: ");
            
            for (loopIndex = 0; loopIndex < lengthOfWord; loopIndex++) {
                if (letterGuessed[loopIndex] == 1) {
                    printf("%c", guessWords[randomIndex][loopIndex]);
                } else {
                    printf("-");
                }
            }
            
            //            printf("\n\nNumber correct so far:%d\n", numCorrect);
            printf("\nEnter a guess letter: ");
            fgets(guess, 11, stdin);
            
            letterEntered = guess[0];
            
            //            printf("You guessed: %c\n\n", letterEntered);
            
            oldCorrect = numCorrect;
            
            for (loopIndex = 0; loopIndex < lengthOfWord; loopIndex++) {
                
                if (letterGuessed[loopIndex] == 1) {
                    continue;
                }
                
                if (letterEntered == guessWords[randomIndex][loopIndex]) {
                    letterGuessed[loopIndex] = 1;
                    numCorrect++;
                }
            }
            
            if (oldCorrect == numCorrect) {
                numLives--;
                if (numLives == 1) {
                    printf("\nWrong guess! You have %d chance left.\n\n", numLives);
                } else {
                    printf("\nWrong guess! You have %d chances left.\n\n", numLives);
                }
                if (numLives == 0) {
                    break;
                }
            } else {
                printf("\nCorrect guess!\n\n");
            }
            
        } // while loop ends
        
        if (numLives == 0) {
            printf("Sorry you lose, the word was: %s\n", guessWords[randomIndex]);
        } else {
            printf("You win! The word is %s!\n", guessWords[randomIndex]);
        }
        
        
    }
    return 0;
}
