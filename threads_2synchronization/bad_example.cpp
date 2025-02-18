#include <iostream>
#include <thread>
#include <mutex>

std::mutex motoMutex;

void driveMotorcycle(const std::string& motoDriver) {
    std::cout << motoDriver << " is starting to drive the motorcycle\n";
    std::this_thread::sleep_for(std::chrono::seconds(2));
    std::cout << motoDriver << " is done driving the motorcycle\n";
}

int main() {
    std::string driver1 = "Lily";
    std::string driver2 = "Angel";

    std::thread d1(driveMotorcycle, std::ref(driver1));
    std::thread d2(driveMotorcycle, std::ref(driver2));

    d1.join();
    d2.join();

    return 0;
}