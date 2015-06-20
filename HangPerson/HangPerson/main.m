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
        
        char userGuess;
        
        char guessWord[8] = "perhaps";
        
        
        printf("Let's Play HangPerson!\n");
        printf("Can you guess the word I have in mind?\n");
        printf("Enter a letter ");
        scanf("%c",&userGuess);
        printf("You guessed %c\n\n", userGuess);
        
        
        
        
        
        
        
        for (char i = 0; i < 8; i++) {
            if(guessWord[i] != userGuess){
                printf("_ _ _ _ _ _ _\n\n");
                printf("Wrong Try Again\n");
                break;
            }
            
            
            
            
        }
        

    }
    return 0;
}
