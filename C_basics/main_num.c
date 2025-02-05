#include <stdio.h>

int main() {
    // numerical types
    char a = 65;           
    signed char b = -65;   
    unsigned char c = 200; 

    short d = -32768;         
    unsigned short e = 65535; 

    int f = -2147483648;         
    unsigned int g = 4294967295; 

    long h = -2147483648;         
    unsigned long i = 4294967295; 

    long long j = -9223372036854775807;            
    unsigned long long k = 18446744073709551615ULL; 

    // floating-point types
    float l = 3.402823466e+38F;                     
    double m = 1.7976931348623158e+308;           
    long double n = 1.18973149535723176502e+4932L;  

    printf("char: %c,\nsigned char: %d,\nunsigned char: %u\n\n", a, b, c);
    printf("short: %d,\nunsigned short: %u\n\n", d, e);
    printf("int: %d,\nunsigned int: %u\n\n", f, g);
    printf("long: %ld,\nunsigned long: %lu\n\n", h, i);
    printf("long long: %lld,\nunsigned long long: %llu\n\n", j, k);
    printf("float: %f\ndouble: %f\nlong double: %Lf\n\n", l, m, n);

    return 0;
}
