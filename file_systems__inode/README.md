### Code Review

It uses the stat system call to fetch details about the file. If you look into the stat source code you will see how they use Structs in C to organize the data and structure their ideas.

It prints out useful information like inode number, file size, number of links, file permissions, and timestamps for last access and modification.


BTW, what are hard links in Linux? <--- they can also be called sym links, and are created in the CLI using the ln command.

When you create a hard link, you create another file name that refers to the same data on the disk. Hard links share the same underlying content. If you modify the file using one of the links, the changes will be visible through the other hard links.