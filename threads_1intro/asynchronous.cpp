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
    std::thread t1(func1);
    std::thread t2(func2);

    t1.join();
    t2.join();

    return 0;
}