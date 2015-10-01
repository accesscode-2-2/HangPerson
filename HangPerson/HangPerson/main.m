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
        
   

        char *Words[] = {"album","music","strat","dooky","guitar","animal","battlestar","galactica","pegasus"};
        
        int count = sizeof(Words)/sizeof(char*) - 1;
        
        int randomNumber = arc4random_uniform(count);
        
        char *randomizeWord = Words[randomNumber];
        
        
        long lengthOfWord = strlen(randomizeWord);
        
        int numberOfLives = 6;
        
        int correctNum = 0;
        int oldCorrect = 0;

        int letterGuessed[11] = { 0,0,0,0,0,0,0,0,0,0,0 };
        
        int quit = 0;
        
        
        char guess[16];
        char userInput;
        
        printf("Time For Hangman");
        
        
        while ( correctNum < lengthOfWord ) {
            printf("\nGuess NOW mofo!!!\nThe word is:");
            for (int i = 0; i < lengthOfWord; i++) {
                if (letterGuessed[i] == 1) {
                    printf("%c", Words[randomNumber][i]);
                }
                else {
                    printf("_ ");
                }
            }
            
            printf("\n");
            
            
            printf("Enter a new letter here:");
           
            fgets(guess, 16, stdin);
            if (strncmp(guess, "quit", 4) == 0) {
                quit = 1;
                break;
            }
            
            userInput = guess[0];
            printf("You entered: %c\n", userInput);
            
            oldCorrect = correctNum;
            for (int i = 0; i < lengthOfWord; i++) {
                if (letterGuessed[i] == 1) {
                    continue;
                }
                
                if (userInput == Words[randomNumber][i]) {
                    letterGuessed[i] = 1;
                    correctNum++;
                }
            }
            if (oldCorrect == correctNum) {
                numberOfLives--;
                printf("Sorry, wrong letter.\n");
                if (numberOfLives == 0){
                    break;
                }
            }else{
                printf("Correct letter!\n");
            }
        }
        
        if (quit == 1) {
            printf("You quit!Good Bye.\n");
        }
        else if (numberOfLives == 0){
            printf("\n Man you suck...LOSER!!! The word was: %s...Hello!\n",Words[randomNumber]);
        }
        else{
            printf("\nYOU WON!!! The word is  %s!!!\n", Words[randomNumber]);
        }
        
    }
    return 0;
}
