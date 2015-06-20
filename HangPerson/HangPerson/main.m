//
//  main.m
//  HangPerson
//
//  Created by Michael Kavouras on 6/15/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

//Hang Man game designed to take anyword from a user
//Ask users to guess the word
//Declear a winner if all letters are guessed
//Issue notice if max amount or wrong trys are met

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        //declare char array to hold user input
        char mySecretWord[20];
        
        
        //ask for user input to get a word...can only be masked by disabling echo in terminal(??)
        printf("enter your secret word --This will be masked in next version: ");
        scanf("%19s",mySecretWord);
        
        
        //declare variable count and give it value of the length of user input
        int count = strlen(mySecretWord);
        //printf("size of array = %d\n",count);
        
        
        //declare int variable to keep track of correct and incorrect answers
        int corrAns =0;
        int inCorrAns =0;
        
        //declare int j to start a for loop
        int j;
        //declare guessLetter as char to accept user guess as single letters
        char guessLetter;
        
        //enter line dashes for each character in mySecretWord
        char blankArrayDashes[20] = {'_','_','_','_','_','_','_','_','_'};
        
        
        for (j = 0; j < count; j++){
            
            //initialize char variable to take user input
            //ask user to enter a letter as input
            printf("\n Enter a letter to guess the hidden word:>> ");
            scanf("%s",&guessLetter);
            
            
            //initailize for loop that uses count to loop thru mySecretWord
            int i;
            for (i = 0; i < count; i++){
                //compare user char from input to each char in mySecretWord
                if (guessLetter == mySecretWord[i]){
                    
                    //if match is found update place holder with matched char
                    blankArrayDashes[i] = mySecretWord[i];
                    printf("%s",blankArrayDashes);
                    
                    
                    //print to console and increase corrAns by 1
                    printf("good job!, match found!!\n");
                    corrAns++;
                    
                    //nested if statement to check if corrAns is equal to count (number of letters in the array)
                    if (corrAns == count){
                        printf("YOU WIN");
                    }
                    
                } else {
                    //printf("try again");
                    
                    if (inCorrAns == count - 1) {
                        printf("Not A Winner, please try again");
                        inCorrAns++;
                        
                    }
                }
            }
        }
    }
    
    
    
    return 0;
    
}