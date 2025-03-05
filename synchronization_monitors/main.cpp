#include <iostream>
#include <mutex>
#include <condition_variable>
#include <thread>

class Monitor {
private:
    std::mutex mtx;
    std::condition_variable cond_var;
    bool data_ready = false;

public:
    void prepare_data() {
        std::unique_lock<std::mutex> lock(mtx);
        // Simulate data preparation
        std::cout << "Preparing data...\n";
        data_ready = true;
        cond_var.notify_one(); // Notify consumer
    }

    void process_data() {
        std::unique_lock<std::mutex> lock(mtx);
        cond_var.wait(lock, [this] { return data_ready; }); // Wait using predicate
        std::cout << "Processing data...\n";
        data_ready = false; // Reset condition
        cond_var.notify_one(); // Notify potential producers
    }
};

int main() {
    Monitor monitor;

    std::thread producer([&monitor] { monitor.prepare_data(); });
    std::thread consumer([&monitor] { monitor.process_data(); });

    producer.join();
    consumer.join();

    return 0;
}
