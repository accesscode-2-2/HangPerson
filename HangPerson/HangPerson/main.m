//
//  main.m
//  BubbleSortHomework
//
//  Created by Shena Yoshida on 2015-06-17.
//  Copyright (c) 2015 Shena Yoshida. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    //I'm going to start by offering the user a little bit of context.
    printf("*******************************************\n");
    printf("*              * * * * * *                *\n");
    printf("*             HELLO WORLD!!               *\n");
    printf("*              * * * * * *                *\n");
    printf("*******************************************\n\n");
    
    
    //And then slowing it down with usleep.
    usleep(1e6);
    printf("Let's play HANGPERSON!!!\n\n");
    usleep(1e6);
    printf("Now, this word has SEVEN leters.\n");
    usleep(1e6);
    printf("and you are only allowed TEN guesses.\n\n");
    usleep(1e6);
    printf("*******************************************\n");
    printf("*              * * * * * *                *\n");
    printf("*             LET'S BEGIN!!               *\n");
    printf("*              * * * * * *                *\n");
    printf("*******************************************\n\n");
    usleep(1e6);
    
    
    // array of chars with your secret word
    char theWord[8] = "almonds";
    // array of chars that represents each letter in my secret word
    char theUnderscores[8] = "_______";
    //    char theUnderscores[8] = {'_','_','_','_','_','_','_','_'};
    // integer that represents the number of guesses a user can take before LOOSING. It's set for 10 in this game
    int maxGuesses = 10; // changed from 10
    // this is the temporary placeholder for when we swap guesses with the underscores
    char temp;
    
    
    // AND now we begin to collect letters from the user, this should be in a "for" loop
    // here we are setting up the values that will be used in the loop
    // char that represents user imput for their letter guess
    char guess;
    // this is a loop variable that we used below to reference how many guesses the user has executed
    int g;
    // represents the number of correct guesses necessary to win the game
    int swaps = 7;
    // this is the for outer loop, it starts at 0, the user can has 10 chances
    for (g = 0; g < maxGuesses; g++) {
        printf("Please choose a letter: ");
        // the computer reads the user's letter and commits it to memory
        scanf("%c", &guess);
        // this just tidies up rogue imput
        char vanish;
        scanf("%c", &vanish);
        
        // this is the nested loop is going through the word "almonds" and the corresponding "underscores"
        for (int i = 0; i < 7; i++) {
            // checks to see if the imput character matches the character in the word at index i. If that is true, then the program will swap the correct letter for the corresponding underscore
            if (guess == theWord[i]) {
                // counts down to the remaining number of swaps until the user wins the game at 0
                swaps--;
                // the following three lines swap correct guesses for corresponding underscores
                temp = theWord[i];
                theWord[i] = theUnderscores[i];
                theUnderscores[i] = temp;
                // shows the remining underscores left in the game
                printf("%s\n",theUnderscores);
            }
        }
        // we're breaking out of the outer loop when there are no swaps left (aka when the puzzle is solved)
        if (swaps == 0) {
            break;
        }
    }
    // once 10 guesses have been used, you loose!
    if (g == maxGuesses) {
        usleep(1e6);
        printf("       * * * * * * * * * * * * *         \n");
        printf("      * YOU HAVE NO MORE GUESSES *       \n");
        printf("        * * * * * * * * * * * *          \n");
        printf("             * GAME OVER *               \n");
        printf("              * * * * * *                \n");
        
        
        // once there are no remaining swaps to execute, the puzzle has been solved and everyone is happy
    } else {
        printf("*******************************************\n");
        printf("*          * * * * * * * * * *            *\n");
        printf("*         * HOORAY!! YOU WIN!! *          *\n");
        printf("*          * * * * * * * * * *            *\n");
        printf("*******************************************\n\n");
    }
    return 0;
}
