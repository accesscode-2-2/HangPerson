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
        
        char word[9] = "computer";
        char dash[9] = "________";
        char guess;
        int counter = 0;
        int comparison = 0;
        int match;
        int result = 0;
        
        while (counter < 8 && !result) {
            match = 0;
            printf("\nGuess a letter: ");
            scanf("%c", &guess);
            for (int i = 0; i < strlen(word); i++) {
                if (guess == word[i]) {
                    dash[i] = word[i];
                    match = 1;
                }
            }
            for (int j = 0; j < strlen(word); j++) {
                printf("%c", dash[j]);
            }
            scanf("%c", &guess);
            comparison = strcmp(dash, word);
            if (match == 0) {
                counter++;
            }
            if (comparison == 0) {
                result = 1;
                printf("\nYou win!");
            }
            if (counter == 8) {
                printf("\nYou lose!");
            }
        }
    }
    return 0;
}