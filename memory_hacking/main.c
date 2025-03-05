#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define BUFFERSIZE 10

char buffer[BUFFERSIZE]  = "message";
char password[BUFFERSIZE] = "passw0rd";

int main(int argc, char **argv) {
    if (argc != 3) {
        printf("\nusage %s <password> <message_to_print>\n",argv[0]);
        exit(1);
    }
    
    strcpy(buffer, argv[2]); // bad :)
    //strncpy(buffer, argv[2], BUFFERSIZE); // good :)
    
    // work with user input, this can get dangerous
    if (strcmp(argv[1],password) == 0) {
        printf("password looks good\n");
        printf("My Msg: %s\n",buffer);
    } else {
        printf("password error!\n");
    }

    return 0;
}
