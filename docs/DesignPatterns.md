<!-- vim-markdown-toc GFM -->

- [Creational Patterns](#creational-patterns)
  - [Abstract Factory](#abstract-factory)
  - [Builder](#builder)
  - [Factory](#factory)
  - [Object Pool](#object-pool)
  - [Prototype](#prototype)
  - [Sigleton](#sigleton)
- [Structural Patterns](#structural-patterns)
  - [Adapter](#adapter)
  - [Bridge](#bridge)
  - [Composite](#composite)
  - [Decorator](#decorator)
  - [Facade](#facade)
  - [Flyweight](#flyweight)
  - [Proxy](#proxy)
- [Behavioral Patterns](#behavioral-patterns)

<!-- vim-markdown-toc -->

## Creational Patterns

### Abstract Factory

1. Provide an interface for creating families of related or dependent objects without specifying
   their concrete classes.
2. A hierarchy that encapsulates: many possible "platforms", and the construction of a suite of
   "products".
3. The `new` operator considered harmful.
4. The three statements above imply the following:
   - Each product has multiple styles.
   - Products with different styles should be produced in separate factories tailored to their
     specific styles.
   - For instance, consider products A and B, each available in styles X and Y.
   - To manufacture these four variations, two factories are needed: Factory X and Factory Y.
   - Factory X produces products A and B with style X.
   - Factory Y produces products A and B with style Y.
5. [README](https://gitee.com/banana33/design-patterns-cpp/blob/master/abstract-factory).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/abstract-factory/AbstractFactory.cpp).

### Builder

1. Separate the construction of a complex object from its representation so that the same
   construction process can create different representations.
2. Parse a complex representation, create one of several targets.
3. The two statements above imply the following:
   - Each product consists of several components.
   - Different arguments are passed to these components to create distinct products.
   - Each builder is responsible for a single product and determines the specific arguments passed
     to the components.
   - Directors only need to call the appropriate builder to produce the required product.
4. [README](https://gitee.com/banana33/design-patterns-cpp/blob/master/builder).
5. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/builder/Builder.cpp).

### Factory

1. Define an interface for creating an object, but let subclasses decide which class to instantiate.
   Factory Method lets a class defer instantiation to subclasses.
2. Defining a "virtual" constructor.
3. The `new` operator considered harmful.
4. The three statements above imply the following:
   - There are multiple products.
   - A single factory can produce all these products.
   - For instance, consider products A and B.
   - To manufacture their four variations, only one factory is required.
   - The factory is capable of producing both products A and B.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/factory-method).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/factory-method/FactoryMethod.cpp).

### Object Pool

1. Object pooling can offer a significant performance boost.
2. It is most effective in situations where the cost of initializing a class instance is high, the
   rate of instantiation of a class is high, and the number of instantiations in use at any one time
   is low.
3. The two statements above imply the following:
   - A resource is reused multiple times.
   - An object with a list as a member is created to manage the resource.
   - When a resource is requested, the object checks whether an available resource exists:
     - If one exists, it is returned.
     - Otherwise, a new resource is created and returned.
4. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/object-pool).
5. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/object-pool/ObjectPool.cpp).

### Prototype

1. Specify the kinds of objects to create using a prototypical instance, and create new objects by
   copying this prototype.
2. Co-opt one instance of a class for use as a breeder of all future instances.
3. The `new` operator considered harmful.
4. The three statements above imply the following:
   - A factory contains many prototype products that have already been created.
   - When a product is needed, the factory calls its `clone` method to produce a copy.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/prototype).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/prototype/Prototype.cpp).

### Sigleton

1. Ensure a class has only one instance, and provide a global point of access to it.
2. Encapsulated "just-in-time initialization" or "initialization on first use".
3. The two statements above imply the following:
   - A class provides one method to instantiate and access itself within itself.
   - The method and its instance are commonly `static` in C++.
   - The class is designed to prevent copying.
4. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/singleton).
5. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/singleton/Singleton.cpp).

## Structural Patterns

### Adapter

1. Convert the interface of a class into another interface clients expect. Adapter lets classes work
   together that couldn't otherwise because of incompatible interfaces.
2. Wrap an existing class with a new interface.
3. Impedance match an old component to a new system.
4. The three statements above imply two meanings as follows:
   - Class Adapter (Inheritance-based):
     - Create three classes: `Target`, `Adaptee`, and `Adapter`.
     - The `Adapter` class inherits from both `Target` and `Adaptee`.
     - The `Target` class only provides pure `virtual` methods.
     - The `Adaptee` class provides all access methods.
     - The `Adapter` class implements all pure `virtual` methods of the `Target` class, and these
       implementations call the methods of the `Adaptee` class.
     - The client only needs to create a `Target` pointer to an instance of the `Adapter` class and
       call its methods.
   - Object Adapter (Composition-based):
     - Create three classes: `Target`, `Adaptee`, and `Adapter`.
     - The `Adapter` class inherits from the `Target` class.
     - The `Target` class only provides pure `virtual` methods.
     - The `Adaptee` class provides all access methods.
     - The `Adapter` class creates and manages an `Adaptee` pointer to an `Adaptee` instance and
       implements all pure `virtual` methods of the `Target` class. These implementations call the
       methods of the `Adaptee` class.
     - The client only needs to create a `Target` pointer to an instance of the `Adapter` class and
       call its methods.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/adapter).
6. [Inheritance-based Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/adapter/ClassAdapter.cpp).
7. [Composition-based Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/adapter/ObjectAdapter.cpp).

### Bridge

1. Decouple an abstraction from its implementation so that the two can vary independently.
2. Publish interface in an inheritance hierarchy, and bury implementation in its own inheritance
   hierarchy.
3. Beyond encapsulation, to insulation
   - Create two interfaces: `Implementor` and `Abstraction`.
   - Both `Implementor` and `Abstraction` only provide pure `virtual` methods.
   - Subclasses of `Abstraction` are associated with `Implementor`, but both can vary independently.
   - For example:
     - Create two classes, `ConcreteImplementorA` and `ConcreteImplementorB`, inheriting from
       `Implementor`.
     - Create a class, `RefinedAbstraction`, inheriting from `Abstraction`.
     - `RefinedAbstraction` implements all pure `virtual` methods to access `Implementor` and its
       subclasses. It also creates an `Implementor` pointer to an instance of a subclass of
       `Implementor`.
     - The client only needs to:
       - Create an `Implementor` pointer to a specific instance of a subclass of `Implementor`.
       - Use it to construct an `Abstraction` pointer to a `RefinedAbstraction` instance.
       - Call methods of the `Abstraction` interface.
4. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/bridge).
5. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/bridge/Bridge.cpp).

### Composite

1. Compose objects into tree structures to represent whole-part hierarchies. Composite lets clients
   treat individual objects and compositions of objects uniformly.
2. Recursive composition.
3. "Directories contain entries, each of which could be a directory."
4. 1-to-many "has a" up the "is a" hierarchy.
5. The four statements above imply the following:
   - Use a subclass to manage and access other subclasses.
   - There are at least three classes: `Component`, `Composite`, and `Leaf`.
   - `Component` is an interface that provides pure `virtual` methods to access itself.
   - Both `Composite` and `Leaf` inherit from `Component`.
   - `Composite` has at least one container member used to store instances of `Leaf`.
   - It provides methods to manage this container and implements all `virtual` methods of
     `Component` by calling the corresponding `virtual` methods with the same function signature
     implemented by `Leaf` to access all `Leaf` instances stored in this container.
   - `Leaf` implements all `virtual` methods of `Component` to access itself.
   - The client only needs to create an instance of `Composite` to manage and access all instances
     of `Leaf`.
6. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/composite).
7. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/composite/Composite.cpp).

### Decorator

1. Attach additional responsibilities to an object dynamically. Decorators provide a flexible
   alternative to subclassing for extending functionality.
2. Client-specified embellishment of a core object by recursively wrapping it.
3. Wrapping a gift, putting it in a box, and wrapping the box.
4. The three statements above imply the following:
   - Replace combinational inheritance with combinational construction.
   - Use one subclass to decorate another subclass.
   - For example:
     - Create five classes: `Component`, `ConcreteComponent`, `Decorator`, `ConcreteDecoratorA`, and
       `ConcreteDecoratorB`.
     - Both `ConcreteComponent` and `Decorator` inherit from `Component`.
     - Both `ConcreteDecoratorA` and `ConcreteDecoratorB` inherit from `Decorator` and are used to
       decorate `ConcreteComponent`.
     - `Component` acts as an interface.
     - `ConcreteComponent` implements all `virtual` methods of `Component` to manage its data.
     - `Decorator` stores a `Component` pointer to an instance of `ConcreteComponent` or a subclass
       of `Decorator` and implements all `virtual` methods of `Component` by calling the
       corresponding `virtual` methods with the same function signature implemented by the instance
       the pointer refers to (`ConcreteComponent` or subclasses of `Decorator`).
     - `ConcreteDecoratorA` and `ConcreteDecoratorB` override all `virtual` methods of `Decorator`
       by:
       - Calling the corresponding `virtual` methods with the same function signature implemented by
         `Decorator` first.
       - Providing their own operations.
     - The client only needs to create a `Component` pointer to a combinational-construction object
       like this:
       `Compoenent* tar = new ConcreteDecoratorB( new ConcreteDecoratorA( new ConcreteComponent() ) );`.
       The instance of `ConcreteComponent` must be created first.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/decorator).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/decorator/Decorator.cpp).

### Facade

1. Provide a unified interface to a set of interfaces in a subsystem. Facade defines a higher-level
   interface that makes the subsystem easier to use.
2. Wrap a complicated subsystem with a simpler interface.
3. The two statements above imply the following:
   - Define a wrapper to encapsulate multiple classes and unify the access operations to these
     classes.
   - For example:
     - There are four classes: `SubsystemA`, `SubsystemB`, `SubsystemC`, and `Facade`.
     - The three subsystem classes (`SubsystemA`, `SubsystemB`, and `SubsystemC`) only provide their
       own methods.
     - `Facade` stores three pointers to the subsystem classes and provides methods that either:
       - Call methods of the subsystem classes to access their functionality, or
       - Manage the lifetime of the subsystem classes.
     - The client only needs to create a `Facade` instance to access and manage these three
       subsystem classes.
4. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/facade).
5. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/facade/Facade.cpp).

### Flyweight

1. Use sharing to support large numbers of fine-grained objects efficiently.
2. The Motif GUI strategy of replacing heavy-weight widgets with light-weight gadgets.
3. The two statements above imply the following:
   - If the number of instances of a class is significant, the class should be separated into two
     parts: the shared (state-independent, intrinsic) part and the unique (state-dependent,
     extrinsic) part.
   - The shared part is stored in the `Flyweight`.
   - The unique part is either stored or computed by client objects and passed to the `Flyweight`
     when its operations are invoked.
4. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/flyweight).
5. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/flyweight/Flyweight.cpp).

### Proxy

1. Provide a surrogate or placeholder for another object to control access to it.
2. Use an extra level of indirection to support distributed, controlled, or intelligent access.
3. Add a wrapper and delegation to protect the real component from undue complexity.
4. The three statements above imply the following:
   - Create a Proxy object that holds a pointer to the RealSubject object and provides methods to
     access and manage it.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/proxy).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/proxy/Proxy.cpp).

## Behavioral Patterns
