dynamic binding, static binding, dynamic binding
(72) c++17 binding [].
(51) structured binding: It is a new feature introduced in C++17 that allows us to handle multiple
return values more effectively and makes our code cleaner. When certain structures are used only once,
we can leverage structured binding to simplify them.
    std::tie(...) = functionName( ... );
    auto[ ... ] = functionName( ... );
