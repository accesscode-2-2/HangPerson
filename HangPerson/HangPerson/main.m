//
//  main.m
//  hangMan-homework
//
//  Created by Kaira Villanueva on 6/16/15.
//  Copyright (c) 2015 apps. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // ** prints out different levels
        printf("////*** HANGMAN ***////");
        printf("\n\nAre you ready to play?\n");
        printf("\n '1' for Level 1 -- UNLOCKED");
        printf("\n '2' for Level 2 -- LOCKED");
        printf("\n '3' for Level 3 -- LOCKED");
        printf("\n '4' for Level 4 -- LOCKED");
        printf("\n '5' for Level 5 -- LOCKED\n");
        printf("\nENTER: ");
        
        // ** asks the user for a level
        int levelSelect;
        scanf("%d", &levelSelect);
        
        if(levelSelect == 1){
            
            // LEVEL 1
            
            
            printf("\nYOU HAVE CHOSEN LEVEL 1");
            printf("\n\nHINT: ADJECTIVE");
            
            char levelOne[6] = { 'h', 'a', 'p', 'p', 'y', '\0'};
            char empty[6];
            char levelOneMatch[6];
            char levelOneGuesses[100];
            int count;
            count = sizeof(levelOne)/sizeof(char);
            
            // VARAIBLES
            
            int tries = 0;
            int maxTries = 7;
            int match = 0;
            int counterWrong = 0;
            char *s; // same char 2x
            BOOL gameOver = NO;
            
            // START GAME
            
            while (!gameOver){
                
                // ** asks for user input
                printf("\n\nENTER LETTER: ");
                char guessLetter;
                scanf(" %c", &guessLetter);
                char emptyTwo[100];
                printf("LETTER ENTERED: ");
                
                
                // ** converts uppercase letter to lower case
                char c;
                c = guessLetter;
                if (isupper(c)) c=tolower(c);
                
                
                // ** checks if player guessed the same char twice
                if (!(memchr(levelOne, c, sizeof(levelOne)))){
                    printf("WRONG GUESS!\n");
                    counterWrong++;
                    switch (counterWrong) {
                        case 1:
                            printf(" _________     \n");
                            printf("\n");
                            break;
                        case 2:
                            printf(" _________     \n");
                            printf("|         |    \n");
                            printf("\n");
                            break;
                        case 3:
                            printf(" _________     \n");
                            printf("|         |    \n");
                            printf("|         0    \n");
                            printf("\n");
                            break;
                        case 4:
                            printf(" _________     \n");
                            printf("|         |    \n");
                            printf("|         0    \n");
                            printf("|        /|\\  \n");
                            printf("\n");
                            break;
                        case 5:
                            printf(" _________     \n");
                            printf("|         |    \n");
                            printf("|         0    \n");
                            printf("|        /|\\  \n");
                            printf("|        / \\  \n");
                            printf("\n");
                            break;
                        case 6:
                            printf(" _________     \n");
                            printf("|         |    \n");
                            printf("|         0    \n");
                            printf("|        /|\\  \n");
                            printf("|        / \\  \n");
                            printf("|              \n");
                            printf("\n");
                            break;
                        case 7:
                            printf(" _________     \n");
                            printf("|         |    \n");
                            printf("|         0    \n");
                            printf("|        /|\\  \n");
                            printf("|        / \\  \n");
                            printf("|              \n");
                            printf("|              \n");
                            printf("\n");
                            break;
                        default:
                            printf("...");
                    }
                }
                
                
                // ** checks for the correct match
                for (int i = 0; i < count; i++){
                    if (c == levelOne[i]){
                        //printf("There is a match!\n");
                        //printf("Guess: %c matches %c \n", c, levelOne[i]);
                        match++;
                        //printf("match number: %d", match);
                        levelOneMatch[i] = c;
                        tries--;
                    }
                }
                
                
                // ** prints out the correct matches
                for (int i = 0; i < count; i++){
                    printf("%c ", levelOneMatch[i]);
                }
                
                
                // ** checks if player guessed the same char twice
                levelOneGuesses[tries] = c;
                s = strstr(levelOneGuesses, &c);
                if (s != NULL){
                    printf("You already guessed this letter!\nPlease pick another letter.\n");
                }
                
                
                // ** increases the count for tries
                tries++;
                printf("\n\nYou have %d tries left\n", maxTries - tries);
                
                
                
                // ** checks to see if the user's array matches the OG word's array
                if ( levelOneMatch[0] == levelOne[0] && levelOneMatch[1] == levelOne[1] && levelOneMatch[2] == levelOne[2] && levelOneMatch[3] == levelOne[3] && levelOneMatch[4] == levelOne[4] && levelOneMatch[5] == levelOne[5] ){
                    printf("\nYOU WON!\n%s", levelOneMatch);
                }
                
                
                // ** this is the game state that puts the player into game over if exceeded tries
                if (tries == maxTries){
                    gameOver = YES;
                    printf(" _________     \n");
                    printf("|         |    \n");
                    printf("|         0    \n");
                    printf("|        /|\\  \n");
                    printf("|        / \\  \n");
                    printf("|              \n");
                    printf("|              \n");
                    printf("|  GAME OVER!  \n");
                }
                
            } // while loop game end
            
        } // level select 1 end
        
    }
    return 0;
}
