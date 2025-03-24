# What is a Page?
* A page is a fixed-size block of data or code that is part of a process in virtual memory.
* When a program is executed, it does not load the entire program into memory at once. Instead, it is divided into smaller pages that are loaded as needed.
* Pages reside in virtual memory (typically stored on a hard drive or SSD when not in active use).

### Page Key Characteristics:
Fixed Size: The size of a page is determined by the operating system (e.g., 4KB).
Logical Unit: Pages are part of the logical address space of a process.
Demand Paging: Pages are loaded into memory only when needed, reducing the memory usage.


# What is a Frame
* A frame is a fixed-size block of physical memory (RAM) where a page can be loaded.
* Physical memory is divided into frames of the same size as the pages.
* The operating system uses frames to manage physical memory efficiently.

### Frame Key Characteristics:
Fixed Size: The size of a frame matches the size of a page (e.g., 4KB) to allow seamless mapping.
Physical Unit: Frames are part of the physical address space (actual RAM).
Page Replacement: If no free frames are available, a page in a frame might be replaced using an algorithm like FIFO or LRU.

# How They Relate?
Page: Belongs to the virtual memory (logical space).
Frame: Belongs to the physical memory (actual RAM).

# Analogy - Think of a Library

**Pages** Books requested by users (logical memory requests).
**Frames:** Limited shelves in the library (physical memory).
* When a user requests a book (page), the librarian checks if it’s already on the shelf (frame).
* If it is there, the book is handed to the user (page hit).
* If it is not there, the librarian fetches it from storage (page fault) and may remove an older book to make room (page replacement).
