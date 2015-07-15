//
//  main.m
//  HangPerson
//
//  Created by Michael Kavouras on 6/15/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    char word[] = "code";
    char guess;
    
    printf("Enter a letter: ");
    
    for (int i = 0; i < 10; i++) {
        
        scanf("%c", &guess);
        
        if (guess == word [i]) {
            guess = word [i];
            printf("%c", word[i]);
        }
        
        if (i == 9) {
            
            printf("You lose!");
            
        }
        
    }
    
    return 0;
}