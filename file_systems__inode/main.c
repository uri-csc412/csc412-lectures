#include <stdio.h>
#include <sys/stat.h>
#include <time.h>

int main(int argc, char *argv[]) {
    struct stat fileStat;
    
    // check if the correct number of arguments is provided
    if (argc != 2) {
        printf("Usage: %s <file_path>\n", argv[0]);
        return 1;
    }

    // get that info! :)
    if (stat(argv[1], &fileStat) < 0) {
        perror("Error obtaining file info");
        return 1;
    }
    
    printf("File: %s\n", argv[1]);
    printf("Inode: %llu\n", fileStat.st_ino);
    printf("Size: %lld bytes\n", fileStat.st_size);
    printf("Number of hard links: %u\n", fileStat.st_nlink);
    printf("File type and permissions: %o\n", fileStat.st_mode);
    printf("Last accessed: %s", ctime(&fileStat.st_atime));
    printf("Last modified: %s", ctime(&fileStat.st_mtime));

    return 0;
}
