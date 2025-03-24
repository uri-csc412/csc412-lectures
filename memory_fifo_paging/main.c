#include <stdio.h>

/*

This program simulates a page replacement algorithm using FIFO:

The incoming stream of page references is processed one at a time.
If the current page is not already in memory (a miss), it causes a "page fault":
    If there's an empty frame, the page is loaded into it.
    If all frames are occupied, the oldest page is replaced using FIFO.
After processing each page, the state of the frames is displayed.

*/

int main() {
    // define the incoming stream of page references
    int incomingStream[] = {4, 1, 2, 4, 5}; // holding the sequence of page references
    int pageFaults = 0;     // counter to track the # of page faults (when a page isn't found in the frames)
    int frames = 3;         // number of available frames in memory
    int m, n, s, pages;     // loop counters and temporary variables; tot # of page references in incomingStream
    
    // calculate the total number of page references in the incoming stream
    // divide the total size of the array by the size of one element
    pages = sizeof(incomingStream) / sizeof(incomingStream[0]);

    // print the header for the output table
    printf(" Incoming \t Frame 1 \t Frame 2 \t Frame 3 ");

    // initialize the frame with an array; init each frame with -1 (empty)
    int temp[frames];               
    for (m = 0; m < frames; m++) {
        temp[m] = -1;
    }

    // this is the outer loop to process each page reference
    // it loops through each page reference in incomingStream
    // `s` is used to check if the current page is already present in the frames
    for (m = 0; m < pages; m++) {
        s = 0;
        // check if the page is already in a frame
        for (n = 0; n < frames; n++) {
            if (incomingStream[m] == temp[n]) { // check if the incoming page is already in a frame
                s++;
                pageFaults--; // decrement pageFaults
            } 
        }

        /*
        if the page is not in the frames (s == 0), a page fault occurs:
            if there are empty frames, the page is placed in the first empty frame
            if all frames are occupied, the page replacement uses FIFO, replacing the oldest page
        */
        pageFaults++;
        if ((pageFaults <= frames) && (s == 0)) {
            // if there are empty frames and the page is not in any of them, put it in an empty frame
            temp[m] = incomingStream[m];
        } else if (s == 0) {
            // if all frames are occupied, replace one of them using FIFO replacement
            temp[(pageFaults - 1) % frames] = incomingStream[m];
        }

        // current state of frames after processing the page reference
        printf("\n");
        printf("%d\t\t\t", incomingStream[m]);
        for (n = 0; n < frames; n++) {
            if (temp[n] != -1) {
                printf(" %d\t\t\t", temp[n]);
            } else {
                printf(" - \t\t\t"); // "-" represents empty frames
            }
        }
    }

    printf("\nTotal Page Faults:\t%d\n", pageFaults);
    return 0;
}
