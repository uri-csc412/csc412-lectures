#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *fp = fopen("/proc/iomem", "r");
    if (!fp) {
        perror("Failed to open /proc/iomem");
        return EXIT_FAILURE;
    }

    char line[256];
    printf("Physical Memory Map (from /proc/iomem):\n");

    while (fgets(line, sizeof(line), fp)) {
        printf("%s", line);  // print each part from /proc/iomem
    }

    fclose(fp);
    return EXIT_SUCCESS;
}
