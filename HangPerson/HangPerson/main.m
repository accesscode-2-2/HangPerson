//
//  main.c
//  Hangperson2
//
//  Created by Eric Sanchez on 6/17/15.
//  Copyright (c) 2015 Eric Sanchez. All rights reserved.
//

#include <stdio.h>
#include <string.h>

int main(int argc, const char * argv[]) {
	char secretWord[] = "modular";
	//last character in a C string is NULL \0 this is why the array needs to be one char longer than the string.
	char guessWord[] = "_______";
	int wrongAttempts = 0;
	int maxWrongAttempts = 5;
	char userEntry;
	
	printf("Lets play hangperson\n");
	printf("I'm thinking of a word\n");
	
	while (1) {
		printf("Type a letter\n");
		scanf("%c", &userEntry);
		
		
		//find if the letter is part of the word.
		
		int match = 0;
		for (int i = 0; i < strlen(secretWord); i++) {
			if (userEntry == secretWord[i]) {
				guessWord[i] = userEntry;
				match = 1;
				
			}
			//create a BOOL to check if user letter is correct. If yes, continue through the loop, if not printf incorrect and get out of the loop.
			
			
		}
		
		
		
		if (match == 0) {
			printf("\n Incorrect, try again");
			wrongAttempts++;
			if (wrongAttempts > maxWrongAttempts){
			printf("\n You lose, game over!");
			break;
    
			}
		}
		
		for (int j = 0; j < strlen(guessWord); j++) {
			printf("%c", guessWord[j]);
			//If user's letter is correct, you add the letter to the empty array.
			
			
			printf("\n");
			
		}
		
		printf("\n");
		
		fpurge(stdin);
	}
	
	//If player loses, provide a message that tells them that they've lost
	
	
	
	
	
	
	
	
	
	//If you didnt guess correctly you lose a life (optional)
	
	
	
	
	
	//The second scanf clears the buffer. Catches the "Enter".
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
    return 0;
}
