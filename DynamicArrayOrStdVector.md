
(24) std::vector type: It is a dynamic array, and typically slower than a raw array.
   1) Avoid std::vector automatic resizing: We can use the reserve function to hold memory without
   creating any objects. The reserve function differs from the resize function: while resize creates
   objects to occupy memory, reserve only holds memory without creating objects. This function
   changes the capacity of the vector but does not affect its size.
   2) Avoid calling copy constructors: We can use the emplace_back function instead of push_back
   to prevent unnecessary copying of objects.
   3) Conclusion: To optimize our code, it is essential to understand the system environment and how
   the code works, including functions, objects, operators, etc.
(68) std::vector::push_back: Copy or move all data to a new location, if need; Otherwise, just move new data into the current location.
(69) std::vector:emplace_back: Copy or move old data to a new location and then construct new data in the new location, if need; Otherwise, just construct new data into the current location.
