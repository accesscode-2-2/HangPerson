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
        
            // print instructions
            printf("Time for HANGMAN!!!!\n");
            printf("hint word is....Galactica\n");
            
            //my word to be guessed
            char secretWord[] = "battlestar";
            //plce for my guessed word
            char guessedWord[] = "__________";
            //number of wrong attemps
            
            int count = sizeof(secretWord);
            
            int totalGuesses = 11;
            //for loop better than while loop. this is what's giving the player his/her 11 guesses
            
            
            for (int x = 0; x < totalGuesses; x++) {
                // process guesses from the user
                printf("Please guess a letter\n");
                
                char guessAttempt;
                scanf("%c", &guessAttempt);
                
                printf("%c\n", guessAttempt);
                fpurge(stdin);
                
                for (int i = 0; i < count; i++) {
                    // i goes from 0 -> 9
                    char currentCharacter = secretWord[i];
                    if (guessAttempt == currentCharacter)
                        
                    {
                        // this needs to happen `count` times in order to win
                        guessedWord[i] = currentCharacter;
                    }
                }
                
                int stop = 1;
                
                // loop over guessedWord and see if there are still any underscores
                // if not, then the user has won the game
                for (int j=0; j < count; j++){
                    if (guessedWord[j] == '_') {
                        stop = 0;
                        break;
                    }
                }
                
                // if the game is not still going, then break
                if (stop == 1){
                    printf("%s\n",guessedWord);
                    printf("YOU WIN!!!!!");
                    break;
                    
                    
                }
                
                // print out the guessedWord
                printf("%s",guessedWord);
            }
            return 0;
        }
}
