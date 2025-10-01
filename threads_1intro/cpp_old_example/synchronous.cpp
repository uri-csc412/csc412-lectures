#include <iostream>
#include <thread>

void func1() {
    for (size_t i = 0; i < 250; i++) {
        std::cout << "+";
    }
}

void func2() {
    for (size_t i = 0; i < 250; i++) {
        std::cout << "-";
    }
}

int main() {
    func1();
    func2();

    return 0;
}