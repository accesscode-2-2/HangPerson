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
        
        // code by Xiulan Shi
        
        // original words by creating an array...
        char *myWords[] = {"tribal","google","yahoo","apple","windows","code","develop","techie","coders"};
        
        //total number of array...
        int count = sizeof(myWords)/sizeof(char*) - 1;
        
        //create a randomNumber...
        int randNum = arc4random_uniform(count);
        
        //place to hold the random word...
        char *randWord = myWords[randNum];
        
        //length of a random word...
        
        long lengthOfWord = strlen(randWord);
        
        //number of lives...
        int livesNum = 5;
        
        int correctNum = 0;
        int oldCorrect = 0;
        //the longest word has 7 letters, so use 8 here...
        int letterGuessed[8] = { 0,0,0,0,0,0,0,0 };
        
        int quit = 0;
        
        // guess array:
        
        char guess[16];
        char userInput;
        
        //GAME HEADER...
        
        printf("\t\t\t\tWELCOME TO PLAY THE HANGPERSON GAME!!!\n\n");
        printf("Hangperson is a game where you are expected to guess a word in a certain number of chances that before you hang the Hangperson.\n");
        
        // use while loop for the game... if the length of guess word is smaller than length of the random word, it will keep looping.
        
        while ( correctNum < lengthOfWord ) {
            printf("\nNew Guess...\nThe word that I am thinking of is:");
            //if letterGuessed is correct then it will print the letter, otherwise print underscore "- "
            for (int i = 0; i < lengthOfWord; i++) {
                if (letterGuessed[i] == 1) {
                    printf("%c", myWords[randNum][i]);
                }
                else {
                    printf("_ ");
                }
            }
            
            printf("\n");
            
            printf("Number of correct letters by now: %d\n", correctNum);
            
            printf("Enter a new letter here:");
            //use fgets() function to read a string...guess is the name of a char array, 16 is the amount of text to input plus one, stdin is the name of the standard input device...
            fgets(guess, 16, stdin);
            //if user enter quit, it will break and come out of loop and print the quit message in the end...use strncmp to compare part of two strings...
            if (strncmp(guess, "quit", 4) == 0) {
                quit = 1;
                break;
            }
            
            userInput = guess[0];
            printf("The letter you entered is %c\n", userInput);
            
            oldCorrect = correctNum;
            for (int i = 0; i < lengthOfWord; i++) {
                if (letterGuessed[i] == 1) {
                    continue;
                }
                
                if (userInput == myWords[randNum][i]) {
                    letterGuessed[i] = 1;
                    correctNum++;
                }
            }
            if (oldCorrect == correctNum) {
                livesNum--;
                printf("Sorry, wrong letter.\n");
                if (livesNum == 0){
                    break;
                }
            }else{
                printf("Correct letter!\n");
            }
        }
        //while loop ends...
        //quit message
        if (quit == 1) {
            printf("You quit!Good Bye.\n");
        }
        //run out of 5 lives...
        else if (livesNum == 0){
            printf("\n Sorry, you've run out of lives! YOU LOSE! The word was: %s\n", myWords[randNum]);
        }
        //win the game...
        else{
            printf("\nCongratulations! YOU WIN!!! The word is indeed %s!!!\n", myWords[randNum]);
        }
        
    }
    return 0;
}
