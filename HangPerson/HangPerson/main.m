//
//  main.m
//  HangPerson
//
//  Created by Michael Kavouras on 6/15/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

void printLabel() {
    
    printf("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n");
    printf("*                                                                   *\n");
    printf("*    hh  hh      aaa      nnn   nn   gggggg                         *\n");
    printf("*    hh  hh     aa aa     nnnn  nn  gg                              *\n");
    printf("*    hhhhhh    aa   aa    nn nn nn  gg  gggg   |------|             *\n");
    printf("*    hh  hh   aaaaaaaaa   nn  nnnn  gg    gg   |------|             *\n");
    printf("*    hh  hh  aaa     aaa  nn   nnn   gggggg                         *\n");
    printf("*                                                                   *\n");
    printf("*                          mmm   mmm          aaa      nnn    nn    *\n");
    printf("*                         mm mm mm mm        aa aa     nnnn   nn    *\n");
    printf("*                        mm   mmm   mm      aa   aa    nn nn  nn    *\n");
    printf("*                       mm     m     mm    aaaaaaaaa   nn  nnnnn    *\n");
    printf("*                      mmm           mmm  aaa     aaa  nn    nnn    *\n");
    printf("*                                                                   *\n");
    printf("* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        printLabel();
        
        printf("\n\nI'm thinking of a word. Can you guess it?\n\n_ _ _ _ _ _ _ _ _\n\n");
        
        char myArray[10] = "taekwondo";
        
        int myArraySpaces = 9;
        
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
