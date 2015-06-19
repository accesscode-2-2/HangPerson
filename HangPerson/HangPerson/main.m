//
//  main.m
//  HangManGame
//
//  Created by Jason Wang on 6/17/15.
//  Copyright (c) 2015 Jason Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Start Code HERE
        char hangManWord[8] = "zodiacs";
        char underLineWord[8] = "_______";
        
        int totalLife = 20;
        char guess;
        int numGuess;
        int replace = 7;
        
        
        for (numGuess = 0; numGuess < totalLife; numGuess++) {
            printf("Please guess a Letter: ");
            scanf("%c", &guess);
            for (int i = 0; i < 7; i++) {
                if (guess == hangManWord[i]) {
                    replace--;
                    char temp;
                    temp = hangManWord[i];
                    hangManWord[i] = underLineWord[i];
                    underLineWord[i] = temp;
                    printf("%s \n", underLineWord);
                }
            }
            if (replace == 0){
                break;
            }
            
        }
        if (replace == 0) {
            printf("You WON");
        } else {
            printf("Sorry you LOST");
        }
        
        // End Code HERE
    }
    return 0;
}
