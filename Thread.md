
(40) thread:
   std::thread thread_name(functionPointer); thread_name.join(); // The current thread waits for the
   thread_name thread to finish all of its execution before continuing with its own execution.
   std::this_thread::xxx;
   std::literals::chrono_literals::1s;
   std::this_thread::sleep_for( time ); // Might be larger than time due to its overhead.
   std::chrono::time_point<std::chrono::system_clock> start, end;
   auto start = std::chrono::high_resolution_clock::now();
   auto end = std::chrono::high_resolution_clock::now();
   std::chrono::duration<float> duration = end - start; // milliseconds.
   std::chrono::time_point<std::chrono::steady_clock> start, end;
   auto start = std::chrono::steady_clock::now();
   auto end = std::chrono::steady_clock::now();
   auto duration = end - start;
   1) Utilize a constructor, a destructor, and the object's lifetime to implement a timer object.
   3) A game typically loads different objects asynchronously and in parallel using multiple threads.
   This is why, at times, players can control their characters while some objects remain unresponsive.
(55) std::async:
  1) Pay attention to the lifetimes of variables/objects passed to a function executed asynchronously.
  Instead of passing them as references, it may be better to copy them into the function.
  2) Passing variables/objects as references can lead to issues. Instead, passing them as pointers
  might be a better option.
