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
        
        printf("Let's play Hangman \n \n");
        
        char myWord[] = "anatomy";
        //        char userWord[ ] = "_______\n";
        char userLetter;
        
        int numChances = 5;
        int guessCorrect = 0;
        
        int lengthOfWord = 7 ;
        int userGuess[7] = {0,0,0,0,0,0,0};
        int i = 0;
        char usedLetter[256];
        int trackingLetters=0;
        
        for (int j = 0; j < 256; j++) {
            usedLetter[j] = '\0';
        }
        
        while (guessCorrect < lengthOfWord) {
            printf("\n\nGuess a letter \n");
            scanf("%c*c", &userLetter);
            fpurge(stdin);
            int counter =0;
            
            int checker =0;
            for(int j= 0; j<256; j++){
                if(usedLetter[j]!='\0' && usedLetter[j]==userLetter){
                    checker=1;
                    break;
                }
            }
            if(checker==1){
                continue;
            }
            usedLetter[trackingLetters]=userLetter;
            //compare the user's guess to the letters in my word
            for (i = 0; i < lengthOfWord; i++) {
                if (userLetter == myWord[i]) {
                    userGuess[i] = 1;
                    counter =1;
                    guessCorrect++;
                    
                }
                
            } //end of for loop
            
            if (counter==1){
                printf("Great, that letter is in the word \n");
            }
            if (counter==0){
                numChances--;
                printf("You guessed wrong\n");
            }
            if(numChances==0){
                //              printf("You Lose HAHA\n");
                break;
            }
            //print the player's progress
            for (i = 0; i < lengthOfWord; i++) {
                if (userGuess[i] == 1) {
                    printf("%c ", myWord[i]);
                } else {
                    printf("_ ");
                }
                
                //check if the player won
                //                if (userLetter == myWord[i]) {
                //                    userGuess[i] = 1; //this will change the correct guess to the correct letter in the userWord
                //                    guessCorrect++; //this increases the userGuess count to let the program know that the user is guessing correctly and will decide whether or not the for loop continues --did the user win or lose
                //                }
            }
            trackingLetters++;
        }
        //place results after the end of the while loop
        if (numChances == 0) {
            printf("\n Bummer, you didn't guess the word \n");
        } else {
            printf("\n Check you out! You guessed the right word", myWord);
        }
        
    }
    return 0;
}
