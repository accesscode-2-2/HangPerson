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
        
        printf("Hang Person!\n\n");
        
        char myWord[] = "coder";
        char yourWord[] = "_____";
        int maxNrOfInput = 0;
        
//        BOOL correct=YES;
//        if  ((yourWord[0]=='c')&&(yourWord[1]=='o')&&(yourWord[2]=='d')&&(yourWord[3]=='e')&&(yourWord[4]=='r')) {
//            correct = YES; }
//        else correct= NO;
        
        
        
        printf("Let's Play Hangman!\n\nI'm thinking of a word. Can you guess it?\n");
        
        while (maxNrOfInput <10){
            char letterInput;

            printf("\n\nSelect a letter: ");
            scanf("%s", &letterInput);
            
            // if the input is
            if (letterInput==myWord[0]) {
                (yourWord[0]=letterInput);
                
                
                // if you win
                if ((yourWord[0] == myWord[0]) && (yourWord[1] == 'o')&&(yourWord[2]=='d')&&(yourWord[3]=='e')&&(yourWord[4]=='r')) {
                    printf("\n<<< ");
                    for (int i=0; i<sizeof(myWord); i++) {
                        printf("%c ",yourWord[i]);
                    }
                    printf(" >>>");
                    printf ("\n\nCONGRATS YOU WON!!!");
                    break;
                }
                
                else {
                    for (int i=0; i<sizeof(myWord); i++){
                        printf("%c ",yourWord[i]);
                    }
                }
            }
            else if (letterInput==myWord[1]) {
                (yourWord[1]=letterInput);
                if ((yourWord[0]=='c')&&(yourWord[1]=='o')&&(yourWord[2]=='d')&&(yourWord[3]=='e')&&(yourWord[4]=='r')) {
                    printf("\n<<< ");
                    for (int i=0; i<sizeof(myWord); i++) {
                        printf("%c ",yourWord[i]);
                    }
                    printf(" >>>");
                    printf ("\n\nCONGRATS YOU WON!!!");
                    break;
                }
                else {
                    for (int i=0; i<sizeof(myWord); i++){
                        printf("%c ",yourWord[i]);
                    }
                }
            }
            else if (letterInput==myWord[2]) {
                (yourWord[2]=letterInput);
                if ((yourWord[0]=='c')&&(yourWord[1]=='o')&&(yourWord[2]=='d')&&(yourWord[3]=='e')&&(yourWord[4]=='r')) {
                    printf("\n<<< ");
                    for (int i=0; i<sizeof(myWord); i++) {
                        printf("%c ",yourWord[i]);
                    }
                    printf(" >>>");
                    printf ("\n\nCONGRATS YOU WON!!!");
                    break;
                }
                else {
                    for (int i=0; i<sizeof(myWord); i++){
                        printf("%c ",yourWord[i]);
                    }
                }
            }
            else if (letterInput==myWord[3]) {
                (yourWord[3]=letterInput);
                if ((yourWord[0]=='c')&&(yourWord[1]=='o')&&(yourWord[2]=='d')&&(yourWord[3]=='e')&&(yourWord[4]=='r')) {
                    printf("\n<<< ");
                    for (int i=0; i<sizeof(myWord); i++) {
                        printf("%c ",yourWord[i]);
                    }
                    printf(" >>>");
                    printf ("\n\nCONGRATS YOU WON!!!");
                    break;
                }
                else {
                    for (int i=0; i<sizeof(myWord); i++){
                        printf("%c ",yourWord[i]);
                    }
                }
            }
            else if (letterInput==myWord[4]) {
                (yourWord[4]=letterInput);
                if ((yourWord[0]=='c')&&(yourWord[1]=='o')&&(yourWord[2]=='d')&&(yourWord[3]=='e')&&(yourWord[4]=='r')) {
                    printf("\n<<< ");
                    for (int i=0; i<sizeof(myWord); i++) {
                        printf("%c ",yourWord[i]);
                    }
                    printf(" >>>");
                    printf ("\n\nCONGRATS YOU WON!!!");
                    break;
                }
                else {
                    for (int i=0; i<sizeof(myWord); i++){
                        printf("%c ",yourWord[i]);
                    }
                }
            }
            else {
                printf ("\nSorry, wrong letter\n");
                for (int i=0; i<sizeof(myWord); i++)
                    printf("%c ",yourWord[i]);
            }
            maxNrOfInput++;
        }
        
        if ((yourWord[0]!='c')||(yourWord[1]!='o')||(yourWord[2]!='d')||(yourWord[3]!='e')||(yourWord[4]!='r')) {
            printf ("\n\nYou lost!\n");
        }
        

    }
    return 0;
}
