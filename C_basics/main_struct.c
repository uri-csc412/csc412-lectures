#include <stdio.h>
#include <string.h>

struct Student {
    char name[100];      // Array to hold student's name, assuming a name could be up to 99 characters long
    int age;             // Integer variable to hold student's age
    char student_id[20]; // Array to hold student's ID, change the size as per requirements
    float gpa;           // Float variable to hold student's GPA
};

int main() {
    // create an instance of the Student struct
    struct Student student1;

    // assign values to members of student1
    strcpy(student1.name, "Hot Sauce"); // copy the string into the 'name' array
    student1.age = 21;
    strcpy(student1.student_id, "100088451"); // copy the string into the 'student_id' array
    student1.gpa = 3.2;

    printf("Student Info:\n");
    printf("Name: %s\n", student1.name);
    printf("Age: %d\n", student1.age);
    printf("Student ID: %s\n", student1.student_id);
    printf("GPA: %.2f\n", student1.gpa);

    return 0;
}


