
(23) smart pointer/scope pointer: Create an object on the heap, and automatically destroy it without
using delete when it goes out of scope or when certain conditions are met. A smart pointer is a
wrapper around a real raw pointer. When designing our own data structure, useing a raw pointer instead.
   1) std::unique_ptr type: It is a scope pointer. Create an object on the heap, and automatically
   destroy it without using delete when it goes out of scope. It does not allow us to copy it because
   its copy-assignment operator has been deleted to prevent us from making mistakes. It's created on
   the stack, so there is no overhead.
   std::unique_ptr<Type> object_name(new Type(...));
   std::unique_ptr<Type> object_name = std::make_unique<Type>();
   2) std::shared_ptr type: Its implementation depends on our compiler and standard library. Most
   systems use reference counting to implement it. Reference counting keeps track of how many references
   point to a shared pointer. Each time we create a new reference, the reference count is
   incremented by one. Each time we delete a reference, the reference count is decremented by one.
   If the reference count is reduced to zero, the shared pointer will be automatically deleted. Because
   it has to manage its reference count, there is some overhead. Assigning a std::shared_ptr to another
   std::shared_ptr will increase the reference count. However, assigning a std::shared_ptr to a
   std::weak_ptr will not increase the reference count.
   std::shared_ptr<Type> object_name(new Type(...)); // Not recommended: The reference count and the object will be constructed separately.
   std::shared_ptr<Type> object_name = std::make_shared<Type>(); // Recommended: The reference count and the object will be constructed together, which is more efficient.
   3) std::weak_ptr type: It's also a shared pointer, but it has no reference count. It does not
   manage ownership but can observe an object managed by std::shared_ptr without affecting its reference count.
   std::shared_ptr<Type> object_name = std::make_shared<Type>(); std::weak_ptr<Type> object_nameW = object_name;
   std::weak_ptr<Type> object_nameW; std::shared_ptr<Type> object_name = std::make_shared<Type>(); object_nameW = object_name;
   Usage: If we assign a shared pointer to a raw pointer, some issues occur after the shared pointer is freed. Especially, in multiple threads, a raw pointer may be deleted multiple time. But the weak pointer can solve these issues.
    if two objects reference each other, one must be a weak pointer.
   4) pointer operator or arrow operator: ->. In smart pointers, the -> operator has been overloaded.
   Since the compiler optimizes pointer operator overloading, we can write object_name->_memberName as
   object_name->->_memberName. Additionally, we can overload the pointer operator to get the memory
   offsets of an object's members.
