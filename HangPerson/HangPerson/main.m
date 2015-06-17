//
//  main.m
//  HangPerson
//
//  Created by Michael Kavouras on 6/15/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

struct guesses {
    int guesses;
    char *myArray[9];
    char *emptyArray[256];
    int size;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /* Probably need some char action
         
         blank spaces _ _ _ _ _ _ _ _ _ <--like this
         
         every time for user input I need a scanf
         
         loop through every character and compare it to guess
         
         if guess matches a letter, do the 'swap' function with it
         
         build in a hint
         
         
         */
        
        //word is 'taekwondo'
        
        struct guesses taekwondo;
        taekwondo.guesses = 12;
        taekwondo.myArray[8] = "taekwondo";
        taekwondo.emptyArray[255] = "*********";
        taekwondo.size = 9;
        
        int solved = 0;
        int i;
        
        printf("H-A-N-G-M-A-N\n\n");
        
        printf("I'm thinking of a word with %d letters. Can you guess it?\n\n", taekwondo.size);
        
        while (!solved) {
            
            printf("Enter your letter here: ");
            
            char userGuess;
            
            scanf("%c", &userGuess);
            
            for (int i = 0; i < 9; i++) {
                
                if (userGuess == i) {
                    
                    i = userGuess;
                    
                    
            
                }
                
            printf("%s\n\nYou have %d guesses left!\n\n", taekwondo.emptyArray, (taekwondo.guesses - 1));
                
            }
            
            
            break;
        }
    }
    return 0;
}
