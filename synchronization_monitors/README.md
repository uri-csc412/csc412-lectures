# Synchronization - Monitors

* Used predicate-based `wait()` to avoid spurious wakeups.
* Added multi-threading with `std::thread` to correctly simulate a monitor.
* Ensured condition is reset with notification to avoid consumer starvation in complex cases.

### More Info

In this example, we have a  Monitor  class that contains a `std::mutex` and a  `std::condition_variable`. The `prepare_data()` method is used to simulate data preparation and notify the consumer that the data is ready. The  `process_data()`  method waits for the data to be ready and processes it. 
    
The `main()` function creates a  Monitor  object and starts two threads: one for the producer and one for the consumer. The producer thread calls the `prepare_data()` method, while the consumer thread calls the `process_data()` method. 
    
When the producer prepares the data, it sets the  data_ready  flag to  true  and notifies the consumer using the `cond_var.notify_one()` method. The consumer waits for the data to be ready using the `cond_var.wait()` method with a predicate that checks the `data_ready`  flag. Once the data is ready, the consumer processes it and resets the `data_ready` flag. 

The `std::unique_lock` is used to lock the mutex and automatically unlock it when the lock goes out of scope. This ensures that the mutex is properly locked and unlocked when accessing shared data. 

### Extending the Monitor Object in C++ with Multiple Producers and Consumers 
    
You could extend the code to support multiple producers and consumers using a monitor object. We will use a shared queue to store the data produced by the producers and consumed by the consumers.