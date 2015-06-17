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
            
            for (taekwondo.myArray[i] = 0; taekwondo.myArray[i] < taekwondo.myArray[taekwondo.size - 1]; i++) {
                
                if (&userGuess == taekwondo.myArray[i]) {
                    
                    i = userGuess;
                    
                    taekwondo.emptyArray[i] = &userGuess;
                    
                    printf("%s\n\n", taekwondo.emptyArray);
            
                } else {
                    
                    printf("Incorrect guess!\n\n%s\n\n", taekwondo.emptyArray);
                
                }
                
            printf("You have %d guesses left!\n\n", (taekwondo.guesses - 1));
                
                if (taekwondo.guesses == 0) {
                    
                    printf("GAME OVER ........ FATALITY!");
                }
                
            }
            
            
            break;
        }
    }
    return 0;
}
