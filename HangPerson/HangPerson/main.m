//
//  main.c
//  hangPersonWordGameAyuna
//
//  Created by Ayuna Vogel on 6/17/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//

#include <stdio.h>
#include <string.h>

int main(int argc, const char * argv[]) {

    char letters[] = "marmelade";
    int arraySize = strlen(letters);
    char singleLetterScan;

    printf("I'm thinking of a word. Can you guess it? ");
    char word[arraySize];
    for (int i = 0; i < arraySize; i++) {
        word[i] = '_';
        printf("%c ", word[i]);
    }
    
    int guessesLeft = 6;
    
    while (guessesLeft > 0) {
        printf("\nName a letter: ");
        scanf(" %c", &singleLetterScan);
        int rightOrWrong = 0;
        for (int i = 0; i < arraySize; i++) {
            if (singleLetterScan == letters[i]) {
                word[i] = singleLetterScan;
                rightOrWrong = 1;
            }
            printf("%c ", word[i]);
        }
        if (rightOrWrong == 0) {
            printf("\nWrong! Try again.");
            guessesLeft = guessesLeft - 1;
        }
        if (guessesLeft == 0) {
            printf("\nTHE GAME IS OVER");
        }
        
        int wordsAreSame = 1;
        for (int i = 0; i < arraySize; i++) {
            if (word[i] != letters[i]) {
                wordsAreSame = 0;
                break;
            }
        }
        if (wordsAreSame == 1) {
            printf("\nCONGRATS!");
            break;
        }
    
    }
    
    return 0;
}
