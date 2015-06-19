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
        
        //Create an array of strings
        char *words[] =  {"water", "warrior", "implementation", "car", "coder", "programmer", "access", "code", "refrigerator", "native", "ios", "watch", "spaghetti", "maximum", "minimum", "author", NULL};
        
        
        //Calculate number of elements in array
        int sizeOfArray = sizeof(words)/sizeof(char*) - 1;
        
        //Generate a random number; max number being the total number of elements in the 'words' array
        int randomNumber = arc4random_uniform(sizeOfArray);
        
        //Holds the random word from array
        char *randomWord = words[randomNumber];
        
        //Calculate number of characters in a string
        long wordLength = strlen(randomWord);
        
        //Create an array for the "hidden" word the size of the randomWord to later be filled with dashes
        char hiddenWord[wordLength];
        
        //Variables needed for game
        char guessedLetter;
        int lettersGuessed = 0;
        int guesses = 0;
        int maxGuesses = 10;
        int guessesLeft = maxGuesses - guesses;
        
        
        //Assign dashes for number of letters in the hiddenWord array
        for (int i = 0; i < wordLength; i++) {
            hiddenWord[i] = '-';
        }
        
        //Welcome message + rules
        printf("Welcome to Hangman!");
        
        
        //So long as the player has less guesses than the max amount of guessed allowed
        while (guesses < maxGuesses) {
            
            //Display dashes
            printf("\nYou have %d guesses left. \nYour word is: ", guessesLeft);
            for (int i = 0; i < wordLength; i++) {
                printf("%c", hiddenWord[i]);
            }
            
            //Ask for guessed letter
            printf("\nPlease guess a letter: ");
            scanf("%s", &guessedLetter);
            
            //Increment guess by 1
            guesses++;
            guessesLeft--;
            
            //Loop through every letter
            for (int i = 0; i < wordLength; i++) {
                
                //If guessed letter is in random word, assign it to it's corresponding place
                if (randomWord[i] == guessedLetter) {
                    hiddenWord[i] = guessedLetter;
                    
                    //Increment lettersGuesses
                    lettersGuessed++;
                }
            }
            
            //Congratulate the winner
            if (lettersGuessed == wordLength){
                printf("\nCongratulations! You've guessed the word in %d guesses!", guesses);
                break;
            }
            
            //Notify player that they've ran out of guesses
            if (guesses == maxGuesses) {
                printf("\nYou lose. You've ran out of guesses. The correct word was: %s.", randomWord);
                break;
            }
            
            
            
        }
 
    }
    return 0;
}
