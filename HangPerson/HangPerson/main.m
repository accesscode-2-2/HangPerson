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
        //JAMAAL SEDAYAO HW
        
        //Hangperson- Create a game called "Hang Person" where a user has to guess a predetermined word(s).
        
        // Here are the rules:
        // After every guess, you must print out the current state of the game. (e.g. _ _ n _ n _)
        //  You must determine a maximun number of wrong guesses. If the player guesses too many incorrect letters, they lose and the game ends.
        // If the player looses, provide a message letting them know that they lost.
        // If they win, provide a message letting them know that they won.
        
        //use a while & for loop
        //if user input is a correct guess, switch letter from answer to showAnswer.
        
        
        printf("Let's Play Hangperson!\n");
        
        printf("\nHere's your word: _ _ _ _ _ \n\nClue: in NYC\n\n");
        
        
        char answer[6] = {"dumbo"};     //initialize answer word as array
        char showAnswer[6] = {"_____"}; //initialize array of underscores visible to player
        char temp;                      //variable temp for sort between answer and showAnswer
        int wrongGuess = 0;             //initial number of wrong guesses
        int correctGuess = 0;           //initial number of correct guesses
        
        while (wrongGuess < 6) {                // while loop limits to 6 wrong guesses
            printf("Guess a letter: ");
            char guess;
            scanf(" %c", &guess);
            
            BOOL isCorrect = NO;
            for (int i = 0;i <= 5; i++){
                if (answer[i] == guess || toupper(answer[i]) == guess){ //toupper recognizes if input is capital letters as well
                    temp = answer [i];
                    answer[i] = showAnswer[i];
                    showAnswer[i] = temp;
                    printf("Correct!\n");
                    printf("%s\n", showAnswer);
                    isCorrect = YES;
                    correctGuess += 1;          //correctGuess adds up to 5
                    
                }
                
                if (correctGuess == 5){
                    wrongGuess += 6;
                    printf("You Win!");
                    break;
                }
                
                if (i == 4 && isCorrect == NO) {
                    printf("Wrong!\n");
                    wrongGuess += 1;            //wrongGuess adds up if not correct
                }
                
            }
            
            
        }
        if (wrongGuess >= 6 && correctGuess < 5){
            printf("You Lose! Game Over!");
        }

    }
    return 0;
}
