//
//  main.m
//  HangPerson
//
//  Created by Michael Kavouras on 6/15/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

//struct guesses {
//    int guesses;
//    char *myArray[9];
//    char *emptyArray[256];
//    int size;
//};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /* Probably need some char action
         
         blank spaces _ _ _ _ _ _ _ _ _ <--like this
         
         every time for user input I need a scanf
         
         loop through every character and compare it to guess
         
         if guess matches a letter, do the 'swap' function with it
         
         build in a hint
         
         'taekwondo'
         
         solved if userArray == myArray
         
         */
        


        
        printf("Hangman Game\n\n");
        
        printf("I'm thinking of a word. Can you guess it?\n\n_ _ _ _ _ _ _ _ _\n\n");
        
        char myArray[10] = "taekwondo";
        
        int myArraySpaces = 9;
        
//        char userArray[10] = "_________";
        char userArray[20] = "_ _ _ _ _ _ _ _ _";

        
        int userGuessesLeft = 8;
        
        while (userGuessesLeft != 0) {
            
            printf("Enter char here: ");
            
            char userGuess;
            scanf(" %c", &userGuess);
            fpurge(stdin);
            
            
            for (int i = 0; i < myArraySpaces; i++) {
                
                if (myArray[i] == userGuess) {
                    
                    userArray[i * 2] = userGuess;
                    
                    printf("%s\n\n", userArray);
                    
                    if (strcmp(userArray, myArray) == 0) {
                        
                        printf("You win!");
                    }
                    
                } else {
                    
                }
            }
            
            userGuessesLeft -= 1;
            
            printf("You have %d guesses left!\n\n", userGuessesLeft);

            
        } if (userGuessesLeft == 0 && strcmp(userArray, myArray)) {
            
            printf("GAME OVER ... FATALITY!");
            
        }
    }
    return 0;
}
