
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
