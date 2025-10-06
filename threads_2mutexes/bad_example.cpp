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

    driveMotorcycle(driver1);
    driveMotorcycle(driver2);

    return 0;
}