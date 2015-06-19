//
//  main.m
//  HangPerson
//
//  Henna Ahmed

#import <Foundation/Foundation.h>

void printGuessArray(char *arr, int size){
    for (int i = 0; i<size; i++) {
        if (arr[i] == ':') {
            printf("\t");
        }
        else{
            printf("%c ", arr[i]);
        }
    }

}

void printCharArray(char *arr, int size){
    for (int i = 0; i<size; i++) {
        usleep(2e4);
            printf("%c", arr[i]);
    }
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        char phrase[] = "A Penny Saved Is A Penny Earned",
        alreadyGuessed[26]; // chars already guessed
        
        int sizeOfPhrase = sizeof(phrase)/sizeof(char);
        char guess[sizeOfPhrase]; //clone array for user visual
        
        int numberOfGuesses = 5;
        int guessCount = 0;

        
        //Print initialized guess array

        for (int i = 0; i< sizeOfPhrase-1; i++) {
            if (phrase[i] == ' ') {
                guess[i] = ':';
            }
            else {
                guess[i] = '_';
            }
        }
        
        printf("Let's Play Hang Person! \n\n");

        printGuessArray(guess, sizeOfPhrase);
        printf("\nNumber of wrong guesses left: %d\n", numberOfGuesses);
        
        while (true) {
            BOOL guessed = YES;
            
            for (int i = 0; i<sizeOfPhrase-1; i++) {
                if (guess[i] == '_') {
                    guessed = NO;
                }
            }
            
            if (numberOfGuesses<1) {
                printf("\n\nSorry, you lost! The correct phrase was:\n");
                printCharArray(phrase, sizeOfPhrase);
                break;
            }
            else if (guessed) {
                printf("\n\nYou won!");
                break;
            }
            else {
                char input;
                bool alreadyInGuessArray = NO;
                bool correctGuess = NO;
                printf("Guess a letter: ");
                fpurge(stdin);
                scanf("%c", &input);
                
                
                //check if they guessed this letter already
                
                for (int i = 0; i<26; i++) {
                    if (alreadyGuessed[i] == input) {
                        printf("\n\nYou already guessed the letter %c\n", input);
                        alreadyInGuessArray = YES;
                    }
                }
                
                if (!alreadyInGuessArray) {
                    alreadyGuessed[guessCount++] = input;
                    for (int i = 0 ; i<sizeOfPhrase; i++) {
                        if (phrase[i] == input || phrase[i] == toupper(input) || phrase[i] == tolower(input)) {
                            correctGuess = YES;
                            guess[i] = phrase[i];
                            
                        }
                    }
                    
                    if (!correctGuess) {
                        numberOfGuesses--;
                        printf("\n\nTry Again! %c is not in this phrase\n", input);
                        
                    }
                    else {
                        printf("\n\n");
                    }
                    
                }
                
                printGuessArray(guess, sizeOfPhrase);
                printf("\nNumber of wrong guesses left: %d\n", numberOfGuesses);
                
                
            }
        }
        

    }
    return 0;
}
