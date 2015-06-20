//
//  main.m
//  HangPerson
//
//  Created by Michael Kavouras on 6/15/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>


/* contants */
#define Lives 7

/* my functions*/
void clrscrn( void );
void draw_hangman( int incorrect_tries );

main()
{
    /* variable declarations */
    int num_letters       = 0, /* length of word char array */
    count             = 0, /* for word char array       */
    tries             = 0, /* total tries user has used */
    correct_guesses   = 0, /* # of correct guesses      */
    correct_flag      = 0, /* was guess correct?        */
    repeat_flag       = 0; /* was guess a repeat?       */
    
    char guess;
    
    /* array declarations */
    char word[255]              = " ";
    char hint[255]              = " ";
    char incorrect_letters[255] = " ";
    
    /* get word */
    puts( "Enter a word to play HangPerson!" );
    gets(word);
    
    puts( "Enter a hint\n" );
    gets( hint );
    
    num_letters = strlen( word );
    char visible_word[num_letters]; /* displays correct guesses */
    
    /* initialize visble_word */
    for( count = 0; count < num_letters; count++ )
        visible_word[count] = '-';
    
    visible_word[num_letters] = '\0';
    
    clrscrn();
    puts( "\nHANGMAN" );
    printf( "HINT: %s\n", hint );
    
    while( tries < Lives )
    {
        printf( "WORD: %s\n", visible_word );
        printf( "Incorrect Guesses: %s\n", incorrect_letters );
        printf( "\nGuess a letter (and press 'Enter'): " );
        scanf( " %c", &guess );
        
        /* match guess against previous guesses */
        for( count = 0; count < num_letters; count++ )
            if( guess == visible_word[count] || guess == incorrect_letters[count] )
            {
                repeat_flag  = 1;
                correct_flag = 1;
                break;
            }
        
        if( repeat_flag == 0 )
        /* check for matches in string */
            for( count = 0; count < num_letters; count++ )
            {
                if( guess == word[count] )
                {
                    visible_word[count] = guess;
                    correct_guesses++;
                    
                    if( correct_guesses == num_letters )
                    {
                        puts( "\n\nAwesome! You guessed the word!" );
                        printf( "WORD: %s\n\n", visible_word );
                        exit( 0 );
                    }
                    
                    correct_flag = 1;
                }
            }
        
        if( correct_flag == 0 )
        {
            incorrect_letters[tries] = guess;
            tries++;
        }
        
        /* reset flags */
        repeat_flag  = 0;
        correct_flag = 0;
        
        clrscrn();
        puts( "\nHANGPERSON" );
        printf( "HINT: %s", hint );
    }
    
    puts( "You did not guess the word." );
    printf( "WORD: %s\n\n", visible_word );
    
    return 0;
}

/* clrscrn() clears the screen */
void clrscrn( void )
{
    int x = 0;
    
    for( x = 0; x < 20; x++ )
        printf( "\n" );
}

