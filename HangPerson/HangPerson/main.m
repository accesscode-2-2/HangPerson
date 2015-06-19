//
//  main.m
//  hangman
//
//  Created by Varindra Hart on 6/14/15.
//  Copyright (c) 2015 Varindra Hart. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!\n\n");
        
        //randomly select a word. take the words length using strlen. make two arrays of that length, one for the answer and the other for dashed lines;
        char *words[10]= {"california","controller","navigate","spectacles","cinnamon","zucchini","abcissa","pulchritudinous","impasse","excalibur"};
        //choose index for a word
        int start = arc4random_uniform(10);
        //record the length of the chosen word
        int wordlength = (int)strlen(words[start]);
        //create character arrays to hold the answer word and a dashed line of equal length
        char ans[wordlength];
        char dashed[wordlength];
        //
        for (int i=0; i<wordlength; i++){
            ans[i] = words[start][i];
            dashed[i] = '-';
        }
        
        int win=0;
        int counter = 6;
        int printKey = 0;
        
        printf("Welcome to HANGMAN! When guessing, please enter a letter. \nBut, if you think you know the word then feel free to enter the word! \nEnjoy!\n\n");
        
        while (counter>0){
            
            if (counter==6 && printKey==0){
                printf("***************\n");
                printf("*.. _____  ....\n");
                printf("*..|     |     \n");
                printf("*..|           \n");
                printf("*..|           \n");
                printf("*..|           \n");
                printf("*..|           \n");
                printf("*..|...........\n");
                printf("___|___........\n");
                printf("...............\n");
                printKey++;
            }
            
            int correct = 0;
            char input[256];
            printf("\n%s\n",dashed);
            printf("Guess a letter: ");
            scanf("%255[^\n]%*c",input);
            fpurge(stdin);
            printf("\n");
            int inputLength=0;
            
            if(input[0] ==' '){
                printf("Don't put a space before your letter or word\n");
                continue;
            }
            
            for (int j=0; j<256; j++){
                if(input[j]=='\0'){
                    break;
                }
                inputLength++;
            }
            
            if( inputLength == 1){
                for (int i=0; i<wordlength; i++){
                    if(tolower(input[0])==dashed[i]){
                        correct = -1;
                        break;
                    }
                    if(tolower(input[0])==ans[i]){
                        dashed[i]=tolower(input[0]);
                        correct++;
                    }
                }
            }
            
            if(correct>-1){
                win = win + correct;
            }
            
            if(inputLength==wordlength){
                int checker=0;
                for (int k=0; k<wordlength;k++){
                    if (tolower(input[k])==ans[k]){
                        checker++;
                    }
                }
                if (checker == wordlength){
                    win = wordlength;
                }
            }
            
            if (correct==0){
                counter--;
            }
            
            if (counter==5 && printKey==1){
                printf("***************\n");
                printf("*.. _____  ....\n");
                printf("*..|     |     \n");
                printf("*..|     @     \n");
                printf("*..|           \n");
                printf("*..|           \n");
                printf("*..|           \n");
                printf("*..|...........\n");
                printf("___|___........\n");
                printf("...............\n");
                printKey++;
            }
            
            if (counter==4 && printKey==2){
                printf("***************\n");
                printf("*.. _____  ....\n");
                printf("*..|     |     \n");
                printf("*..|     @     \n");
                printf("*..|     |     \n");
                printf("*..|           \n");
                printf("*..|           \n");
                printf("*..|...........\n");
                printf("___|___........\n");
                printf("...............\n");
                printKey++;
            }
            
            if (counter==3 && printKey==3){
                printf("***************\n");
                printf("*.. _____  ....\n");
                printf("*..|     |     \n");
                printf("*..|     @     \n");
                printf("*..|    -|      \n");
                printf("*..|           \n");
                printf("*..|           \n");
                printf("*..|...........\n");
                printf("___|___........\n");
                printf("...............\n");
                printKey++;
            }
            
            if (counter==2 && printKey==4){
                printf("***************\n");
                printf("*.. _____  ....\n");
                printf("*..|     |     \n");
                printf("*..|     @     \n");
                printf("*..|    -|-    \n");
                printf("*..|           \n");
                printf("*..|           \n");
                printf("*..|...........\n");
                printf("___|___........\n");
                printf("...............\n");
                printKey++;
            }
            
            if (counter==1 && printKey==5){
                printf("***************\n");
                printf("*.. _____  ....\n");
                printf("*..|     |     \n");
                printf("*..|     @     \n");
                printf("*..|    -|-    \n");
                printf("*..|    /      \n");
                printf("*..|           \n");
                printf("*..|...........\n");
                printf("___|___........\n");
                printf("...............\n");
                printKey++;
            }
            
            if (counter==0){
                printf("***************\n");
                printf("*.. _____  ....\n");
                printf("*..|     |     \n");
                printf("*..|     @     \n");
                printf("*..|    -|-    \n");
                printf("*..|    / \\    \n");
                printf("*..|           \n");
                printf("*..|...........\n");
                printf("___|___........\n");
                printf("...............\n");
                printf("\n YOU WIN! JK YOU LOSEEE! LOLOL");
                break;
            }
            if (win == wordlength){
                printf("%s\n",ans);
                printf("_______________________     _____________________________________\n");
                printf("___  __ )__    |__  __ \\    ___    |_  ___/_  ___/__  /__  /__  /\n");
                printf("__  __  |_  /| |_  / / /    __  /| |____ \\_____ \\__  /__  /__  /\n");
                printf("_  /_/ /_  ___ |  /_/ /     _  ___ |___/ /____/ / /_/  /_/  /_/\n");
                printf("/_____/ /_/  |_/_____/      /_/  |_/____/ /____/ (_)  (_)  (_)\n");
                
                printf("\nNICEE!! YOU WIN!! What a hangman GODDDD #KILLIN'IT");
                printf("\n\n\n\n\n\n\n");
                break;
            }
        }
        
        //printf(strlcat(words[1],words[2], 4));
        
        
        
    }
    return 0;
}
