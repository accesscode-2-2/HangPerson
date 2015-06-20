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
        
        // code goes here...
        char word[5] = "pasta";
        char dashes[5] = "_____";
        char input;
        char temp;
        int guesses = 7; //Maximum tries.
        int i;
        int j;
        int swaps = 5;
        
        
        printf("Lets play a Hangman.\n");
        printf("I'm thinking of a word. Can you guess it?\n");
        
        for(i = 0; i < guesses; i++ ) {
            
            printf("select a letter: \n");
            
            printf("%c %c %c %c %c", dashes[0], dashes[1], dashes[2], dashes[3], dashes[4]);
            
            scanf("%c", &input);
            
            
            
            char vanish;
            scanf("%c", &vanish);
            
            for(j = 0; j < 5; j++) {
                
                // positive match
                if (input == word[j]) {
                    
                    swaps--;
                    
                    temp = word[j];
                    word[j] = dashes[j];
                    dashes[j] = temp;
                    
                    
                    printf("\n%c", dashes[j]);
                    
                }
                if (swaps == 0) {
                    break;
                }
            }
            
        }
        
        
        if (guesses == 7) {
            printf("You lost.");
        } else {
            printf("You win");
        }
        
    }
    return 0;
}