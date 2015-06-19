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
        
        char *a[] = {"apple","concatenate","boolean","pencil","bird",
            "bachata","lobster","tango","serendipity","paper"};
        
        char *currentWord = a[arc4random_uniform(10)];
        
        char dashes[strlen(currentWord)];
        
        for(int i=0;i<strlen(currentWord);i++){
            dashes[i]='_';
        }
        
        int guessLimit = 0;
        int cap = (int)strlen(currentWord)-2;
        
        printf("\nLet's Play Hang Person! Here is your word\nTake a guess\n");
        while (true) {
            char guess;
            
            for(int i=0;i<strlen(dashes);i++){
                printf("%c ",dashes[i]);
            }
            printf("\n");
            fseek(stdin, 0, SEEK_END);
            scanf("%c\\n",&guess);
            //            char junk;
            //            scanf("%c",&junk);
            BOOL foundMatch = NO;
            for(int i=0;i<strlen(currentWord);i++){
                
                if(currentWord[i] == guess){
                    dashes[i]=guess;
                    foundMatch = YES;
                }
            }
            if(foundMatch == NO){
                printf("\nSorry wrong guess\n\n");
                guessLimit++;
            }
            if(guessLimit>=cap){
                printf("You exceeded guess limit, sorry you lost!\n");
                printf("Word was: %s",currentWord);
                break;
            }
            BOOL foundDash = NO;
            for(int i=0;i<strlen(dashes);i++){
                if(dashes[i] == '_' ){
                    foundDash = YES;
                }
            }
            if(!foundDash){
                for(int i=0;i<strlen(dashes);i++){
                    printf("%c",dashes[i]);
                }
                printf("\nYOU WON!!!!!!\n");
                break;
            }
        }
        
    }
    return 0;
}
