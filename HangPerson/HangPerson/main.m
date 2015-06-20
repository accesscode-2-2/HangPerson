//
//  main.m
//  HangPerson
//
//  Created by Elber Carneiro on 6/14/15.
//  Copyright (c) 2015 Elber Carneiro. All rights reserved.
//

#import <Foundation/Foundation.h>

// This function returns the size of a string array as long as the last
// element in the array is explicitly set to NULL
size_t arraySize(char *wordArray[]) {
    size_t count = 0;
    while (wordArray[count] != NULL) {
        count++;
    }
    return count;
}

// This function prints the "title screen"
void titleScreen() {
    printf("\n  Let's play a game of HANGPERSON!\n");
    usleep(1e6);
}

// This function sets up the game difficulty
int difficultySetup(int maxWrongGuesses) {
    while (maxWrongGuesses == 0) {
        int difficulty;
        printf("\n  Choose your difficulty in a scale from 1 to 3,\n");
        printf("  3 being the most difficult: ");
        scanf("%d%*c", &difficulty);
        
        switch (difficulty) {
            case 1:
                maxWrongGuesses = 12;
                break;
            case 2:
                maxWrongGuesses = 10;
                break;
            case 3:
                maxWrongGuesses = 8;
                break;
            default:
                printf("\n\n  Sorry, you did not input a number from 1 to 3.\n");
                break;
        }
    }
    
    printf("\n  Okay, let's begin!\n\n");
    usleep(1e6);
    printf("  You have a maximum of %d wrong guesses\n", maxWrongGuesses);
    printf("  before you lose.\n\n");
    usleep(1e6);
    
    return maxWrongGuesses;
}

// This function picks a random word from the wordPool
char * wordSetup(size_t wordPoolSize, char *wordPool[]) {

    printf("  What word am I thinking of?\n");
    
    // pick a random index from the wordpool
    srand((int) time(NULL));
    int randomWordPoolIndex = rand()%wordPoolSize;
    
    // temp variable to hold word we pluck out of the word pool
    char *gameWord = wordPool[randomWordPoolIndex];
    return gameWord;
}

// This function builds the game board
char * getGameBoard(char * gameWord, size_t gameWordSize) {
    // board will be the size of temp with extra spaces between each
    // character
    int boardSize = ((int) gameWordSize * 2 - 1);
    char board[boardSize];
    
    // fill board string with alternating uderscores and spaces
    for (int i = 0; i < gameWordSize; i++) {
        // all indexes that are multiples of 2 will hold underscores
        board[i * 2] = '_';
        // everything else in between will hold spaces. the if statement
        // ensures there is no space following the last underscore
        if (i < gameWordSize - 1) {
            board[i * 2 + 1] = ' ';
        } else {
            board[i * 2 + 1] = '\0';
        }
    }
    
    char * returnBoard = board;
    return returnBoard;
}

//void gameOn(int correctLetters, size_t gameWordSize, int wrongGuesses,
//            int maxWrongGuesses, char * board, char letterGuess,
//            char * gameWord) {
//    // game logic. keeps running as long as you have not used up all your
//    // guesses and have not guessed all the letters of the word
//    while (correctLetters < gameWordSize && wrongGuesses < maxWrongGuesses) {
//        
//        // print inital board
//        printf("\n\n      %s", board);
//        
//        printf("\n\n\n  Guess a letter: ");
//        scanf("%c%*c", &letterGuess);
//        
//        // set up a boolean switch tell the program what to print in
//        // case of a correct or incorrect guess
//        BOOL correctGuess = 0;
//        
//        // check if the letter is in the word
//        for (int i = 0; i < gameWordSize; i++) {
//            if (letterGuess == gameWord[i]) {
//                
//                // if it is, update the display
//                board[i*2] = letterGuess;
//                // update conditionals for the while loop
//                correctLetters++;
//                correctGuess = 1;
//                
//            }
//        }
//        
//        // print different things depending on whether the guess was
//        // correct or not. remind the player how many guesses they
//        // already used.
//        if (correctGuess == 0) {
//            printf("\n\n  Sorry, that's not in the word.\n");
//            wrongGuesses++;
//            if (wrongGuesses == 1) {
//                printf("  That's %d wrong guess!", wrongGuesses);
//            } else {
//                printf("  That's %d wrong guesses!", wrongGuesses);
//            }
//            
//        }
//    }
//}

// This function prints the end of game results
void endGame(int correctLetters, size_t gameWordSize, char * gameWord) {
    
    // print different ending message depending on result
    if (correctLetters == gameWordSize) {
        printf("\n  The word was: \n");
        usleep(1e6);
        printf("\n      <<<<< %s >>>>>\n", gameWord);
        usleep(1e6);
        printf("\n\n  YOU GOT IT!\n\n");
        printf("  HURRAY FOR YOU.\n");
        printf("  A COOL IMAGINARY VICTORY SCREEN APPEARS.\n");
    } else {
        printf("  YOU ARE OUT OF GUESSES!\n");
        printf("\n  The word was: \n");
        usleep(1e6);
        printf("\n      <<<<< %s >>>>>\n", gameWord);
        usleep(1e6);
        printf("\n\n    YOU LOST!\n");
        printf("    YOU KILLED AN IMAGINARY STICK FIGURE.\n");
        printf("    GOOD GOING.\n\n");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        //********* OUR VARIABLES ************************************************//
        
        char *wordPool[] = {"decapitated", "slum", "slush", "fuzzy", "sloppy",
            "slept", "quarry", "nozzle", "shank", "quartz", "iterate", "hangman",
            "illustrious", "cockiness", "doddering", "huffing", "staff",
            "puzzling", "blabbering", "zigzagging", "jazzier", "jagged",
            "zine", "fazed", "queuing", "slap", "hangman", "solutions",
            "technologies", "catacombs", "inserted", "animal", "carpet",
            "lazybones", "molasses", "carnival", "compass", "jelly",
            "compact", "renaissance", "fantastic", "killer", "somber",
            "animal", "arrow", "sloppy", "super", "superfluous", "frugal",
            "innovator", "serpent", "wisdom", "technique", "breakthrough",
            "meditation", "thought", "durable", "succeeded",
            "supercalifragilisticexpialadocious", NULL};
        
        // get the length of the wordPool array
        size_t wordPoolSize = arraySize(wordPool);
        // will hold the player's guesses
        char letterGuess;
        // will hold the random word we pick and the display board
        char *gameWord, *board;
        // this value will be used very often for loops
        size_t gameWordSize;
        // will keep track of how many wrong guesses
        int wrongGuesses = 0;
        // will be used to set difficulty
        int maxWrongGuesses = 0;
        // keep track of total letters filled in correctly. will let program
        // know when the player wins
        int correctLetters = 0;
        
        
        //********* OUR GAME BEGINS **********************************************//
        
        // print title screen
        titleScreen();
        
        // setup the difficulty
        maxWrongGuesses = difficultySetup(maxWrongGuesses);
        
        // pick a random word from the wordPool
        gameWord = wordSetup(wordPoolSize, wordPool);
        
        // calculate size of gameWord to use with loops
        gameWordSize = (int) strlen(gameWord);
        
        // create the game display board
        board = getGameBoard(gameWord, gameWordSize);
        
        // game logic. keeps running as long as you have not used up all your
        // guesses and have not guessed all the letters of the word
        while (correctLetters < gameWordSize && wrongGuesses < maxWrongGuesses) {
            
            // print inital board
            printf("\n\n      %s", board);
            
            printf("\n\n\n  Guess a letter: ");
            scanf("%c%*c", &letterGuess);
            
            // set up a boolean switch tell the program what to print in
            // case of a correct or incorrect guess
            BOOL correctGuess = 0;
            
            // check if the letter is in the word
            for (int i = 0; i < gameWordSize; i++) {
                if (letterGuess == gameWord[i]) {
                    
                    // if it is, update the display
                    board[i*2] = letterGuess;
                    // update conditionals for the while loop
                    correctLetters++;
                    correctGuess = 1;
                    
                }
            }
            
            // print different things depending on whether the guess was
            // correct or not. remind the player how many guesses they
            // already used.
            if (correctGuess == 0) {
                printf("\n\n  Sorry, that's not in the word.\n");
                wrongGuesses++;
                if (wrongGuesses == 1) {
                    printf("  That's %d wrong guess!", wrongGuesses);
                } else {
                    printf("  That's %d wrong guesses!", wrongGuesses);
                }

            }
        }
        
        // print game results
        endGame(correctLetters, gameWordSize, gameWord);

    }
    return 0;
}
