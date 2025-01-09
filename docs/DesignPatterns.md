<!-- vim-markdown-toc GFM -->

- [Creational Patterns](#creational-patterns)
  - [Explanation](#explanation)
  - [Abstract Factory](#abstract-factory)
  - [Builder](#builder)
  - [Factory](#factory)
  - [Object Pool](#object-pool)
  - [Prototype](#prototype)
  - [Sigleton](#sigleton)
- [Structural Patterns](#structural-patterns)
  - [Explanation](#explanation-1)
  - [Adapter](#adapter)
  - [Bridge](#bridge)
  - [Composite](#composite)
  - [Decorator](#decorator)
  - [Facade](#facade)
  - [Flyweight](#flyweight)
  - [Proxy](#proxy)
- [Behavioral Patterns](#behavioral-patterns)
  - [Explanation](#explanation-2)
  - [Chain of Responsibility](#chain-of-responsibility)
  - [Command](#command)
  - [Interpreter](#interpreter)
  - [Iterator](#iterator)
  - [Mediator](#mediator)
  - [Memento](#memento)
  - [Observer](#observer)
  - [State](#state)
  - [Strategy](#strategy)
  - [Template](#template)
  - [Visitor](#visitor)

<!-- vim-markdown-toc -->

## Creational Patterns

### Explanation

1. In software engineering, creational design patterns are design patterns that deal with object
   creation mechanisms, trying to create objects in a manner suitable to the situation.
2. The basic form of object creation could result in design problems or added complexity to the
   design.
3. Creational design patterns solve this problem by somehow controlling this object creation.

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
2. Defining a `virtual` constructor.
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

### Explanation

1. In Software Engineering, Structural Design Patterns are Design Patterns that ease the design by
   identifying a simple way to realize relationships between entities.

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
3. Beyond encapsulation, to insulation.
4. The three statements above imply two meanings as follows:
   - Create two interfaces: `Implementor` and `Abstraction`.
   - Both `Implementor` and `Abstraction` only provide pure `virtual` methods.
   - Subclasses of `Abstraction` are associated with `Implementor`, but both can vary independently.
   - Use `Abstraction` objects to access `Implementor` objects.
   - For example:
     - Create two classes, `ConcreteImplementorA` and `ConcreteImplementorB`, inheriting from
       `Implementor`.
     - Create a class, `RefinedAbstraction`, inheriting from `Abstraction`.
     - `RefinedAbstraction` stores an `Implementor` pointer to an instance of a subclass of
       `Implementor`. It implements all pure `virtual` methods to access this object.
     - The client only needs to:
       - Create an `Implementor` pointer to a specific instance of a subclass of `Implementor`.
       - Use it to construct an `Abstraction` pointer to a `RefinedAbstraction` instance.
       - Call methods of the `Abstraction` interface.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/bridge).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/bridge/Bridge.cpp).

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
   - Use multiple subclasses to decorate another subclass.
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
   - Create a `Proxy` object that holds a pointer to the `RealSubject` object and provides methods
     to access and manage it.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/proxy).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/proxy/Proxy.cpp).

## Behavioral Patterns

### Explanation

1. In software engineering, behavioral design patterns are design patterns that identify common
   communication patterns between objects and realize these patterns.
2. By doing so, these patterns increase flexibility in carrying out this communication.

### Chain of Responsibility

1. Avoid coupling the sender of a request to its receiver by giving more than one object a chance to
   handle the request. Chain the receiving objects and pass the request along the chain until an
   object handles it.
2. Launch-and-leave requests with a single processing pipeline that contains many possible handlers.
3. An object-oriented linked list with recursive traversal.
4. The three statements above imply the following:
   - Allow objects to handle a request, similar to the event mechanism in Qt.
   - Create a `Handler` class as a base class.
   - The `Handler` class stores a pointer to another `Handler` instance (usually a subclass) and
     provides at least two methods:
     - One method to set the pointer to another `Handler` instance (usually a subclass).
     - Another method, `handleRequest`, to call the `handleRequest` method overridden by a subclass
       instance.
   - Subclasses of `Handler` must override the `handleRequest` method to process the request:
     - If the request is successfully handled, terminate the execution of the `handleRequest`
       method.
     - Otherwise, call the `handleRequest` method of the base `Handler` class.
     - The base `Handler` class's `handleRequest` method attempts to delegate the request to the
       next `Handler` instance in the chain.
   - Clients only need to create multiple instances of `Handler` subclasses and organize these
     instances in the desired order to complete the request.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/chain-of-responsibility).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/chain-of-responsibility/ChainOfResponsibility.cpp).

### Command

1. Encapsulate a request as an object, thereby letting you parametrize clients with different
   requests, queue or log requests, and support undoable operations.
2. Promote "invocation of a method on an object" to full object status
3. An object-oriented callback.
4. The three statements above imply the following:
   - Bind actions to specific objects, with or without a chain order, similar to the signal/slot
     mechanism in Qt.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/command).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/command/Command.cpp).

### Interpreter

1. Given a language, define a representation for its grammar along with an interpreter that uses the
   representation to interpret sentences in the language.
2. Map a domain to a language, the language to a grammar, and the grammar to a hierarchical
   object-oriented design.
3. The two statements above imply the following:
   - Design an interpreter to process a language that has its own grammar for representing its
     words, sentences, and other constructs.
   - In modern C++, this design pattern commonly works with abstract syntax trees, syntax trees, and
     tools like Lex (Flex) and Yacc (Bison).
4. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/interpreter).
5. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/interpreter/Interpreter.cpp).

### Iterator

1. Provide a way to access the elements of an aggregate object sequentially without exposing its
   underlying representation.
2. The C++ and Java standard library abstraction that makes it possible to decouple collection
   classes and algorithms.
3. Promote to "full object status" the traversal of a collection.
4. Polymorphic traversal.
5. The four statements above imply the following:
   - Define a class that provides a uniform way to access elements stored in another class.
   - Refer to STL containers and iterators.
6. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/iterator).
7. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/iterator/Iterator.cpp).

### Mediator

1. Define an object that encapsulates how a set of objects interact. Mediator promotes loose
   coupling by keeping objects from referring to each other explicitly, and it lets you vary their
   interaction independently.
2. Design an intermediary to decouple many peers.
3. Promote the many-to-many relationships between interacting peers to "full object status".
4. The three statements above imply the following:
   - Define a class used to manage data transfer among multiple objects.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/mediator).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/mediator/Mediator.cpp).

### Memento

1. Without violating encapsulation, capture and externalize an object's internal state so that the
   object can be returned to this state later.
2. A magic cookie that encapsulates a "check point" capability.
3. Promote undo or rollback to full object status.
4. The three statements above imply the following:
   - Define two classes to manage another class: `Memento`, `Originator`, and `CareTaker`.
   - `Memento` is used to store a single previous state of the `Originator`.
   - `Originator` is a user-defined class that stores data and is declared as a friend class of
     `Memento`.
   - `CareTaker` is a class used to manage the `Originator` and utilizes a container with `Memento`
     to store multiple previous states of the `Originator`.
   - It is responsible for saving the state of the `Originator` after the state has been changed and
     for restoring the `Originator` to a previous state if needed.
   - The client only needs to create an `Originator` object and pass it to a `CareTaker` object.
   - Every time the client changes the state of the `Originator` object, they should also call the
     `store` method of the `CareTaker` object to save the state of the `Originator`.
   - If the client wants to restore the `Originator` object to a previous state, they can call the
     `undo` method of the `CareTaker` object.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/memento).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/memento/Memento.cpp).

### Observer

1. Define a one-to-many dependency between objects so that when one object changes state, all its
   dependents are notified and updated automatically.
2. Encapsulate the core (or common or engine) components in a Subject abstraction, and the variable
   (or optional or user interface) components in an Observer hierarchy.
3. The "View" part of Model-View-Controller.
4. The three statements above imply the following:
   - There are multiple classes whose states depend on another class. Observers depend on a subject.
   - When the state of the other class changes, these classes should be notified.
   - When these classes are instantiated, they should be attached to an instance of the other class
     so that the other class can notify them that its state has changed.
   - For example:
     - Create four classes: `Observer`, `ConcreteObserver`, `Subject`, and `ConcreteSubject`.
     - `ConcreteObserver` and `ConcreteSubject` inherit from `Observer` and `Subject`, respectively.
     - `Observer` provides pure `virtual` methods to update its state and access its state.
     - `Subject` provides pure `virtual` methods to update its state and access its state.
     - Additionally, `Subject` provides the following methods:
       - Attach `Observer` instances (usually subclasses) to it.
       - Detach `Observer` instances (usually subclasses) from it.
       - Notify all attached instances that its state has changed.
     - `Subject` also maintains a container to store the `Observer` pointers to the attached
       `Observer` instances (usually subclasses).
     - `ConcreteObserver` and `ConcreteSubject` only need to implement `virtual` functions and
       manage their states.
     - The client only needs to use `ConcreteObserver` and `ConcreteSubject` to create objects and
       attach `ConcreteObserver` objects to specific `ConcreteSubject` objects.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/observer).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/observer/Observer.cpp).

### State

1. Allow an object to alter its behavior when its internal state changes. The object will appear to
   change its class.
2. An object-oriented state machine.
3. wrapper + polymorphic wrappee + collaboration.
4. The three statements above imply the following:
   - Use a `State` class and its subclasses to determine how the `Machine` class behaves.
   - For example:
     - Define four classes: `State`, `ConcreteStateA`, `ConcreteStateB`, and `Machine`.
     - Both `ConcreteStateA` and `ConcreteStateB` inherit from `State` and represent different
       states of the machine.
     - `State` acts as an abstract base class or interface.
     - `ConcreteStateA` and `ConcreteStateB` provide different implementations of the `State`
       interface.
     - The `Machine` class stores a pointer to a `State` object (typically one of its subclasses)
       and provides a `setState` method to modify its state and manage the lifetime of the `State`
       objects.
     - It also provides other methods to invoke actions defined by the `State` object to complete
       tasks.
     - The client only needs to create a `Machine` object, pass a specific `State` object to it, and
       call its methods to complete tasks.
5. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/state).
6. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/state/State.cpp).

### Strategy

1. Define a family of algorithms, encapsulate each one, and make them interchangeable. Strategy lets
   the algorithm vary independently from the clients that use it.
2. Capture the abstraction in an interface, bury implementation details in derived classes.
3. The two statements above imply the following:
   - Define a family of algorithms in an inheritance tree.
   - A class not in this tree stores a base pointer to one of their instances and is defined for
     calling this family of algorithms.
   - For example:
     - Define five classes: `Strategy`, `ConcreteStrategyA`, `ConcreteStrategyB`,
       `ConcreteStrategyC`, and `Context`.
     - `ConcreteStrategyA`, `ConcreteStrategyB`, and `ConcreteStrategyC` all inherit from
       `Strategy`.
     - `Strategy` provides a pure virtual method to implement a family of algorithms.
     - `ConcreteStrategyA`, `ConcreteStrategyB`, and `ConcreteStrategyC` implement this method
       slightly differently according to their specific purposes, but they all aim for the same
       goal.
     - `Context` stores a `Strategy` pointer to a `Strategy` object (usually one of its subclasses)
       and provides a method to call the algorithm or method implemented by that object.
     - The client only needs to create a `Context` object, pass a specific `Strategy` object
       (usually one of its subclasses) to it, and call the method of the `Context` object.
4. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/strategy).
5. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/strategy/Strategy.cpp).

### Template

1. Define the skeleton of an algorithm in an operation, deferring some steps to client subclasses.
   Template Method lets subclasses redefine certain steps of an algorithm without changing the
   algorithm's structure.
2. Base class declares algorithm 'placeholders', and derived classes implement the placeholders.
3. The two statements above imply the following:
   - Multiple algorithms share similar steps.
   - Except for some critical steps, all other steps are the same across these algorithms.
   - A class inheritance hierarchy can be used to implement these algorithms.
   - The base class provides:
     - Implementations of the shared steps as methods.
     - Pure `virtual` methods to define the critical steps.
     - A unique method that calls all the step methods in the appropriate order.
   - A subclass representing a specific algorithm only needs to implement the `virtual` methods for
     the critical steps of its algorithm.
   - The client only needs to create a specific subclass object and call the unique method.
4. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/template-method).
5. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/template-method/TemplateMethod.cpp).

### Visitor

1. Represent an operation to be performed on the elements of an object structure. Visitor lets you
   define a new operation without changing the classes of the elements on which it operates.
2. The classic technique for recovering lost type information.
3. Do the right thing based on the type of two objects.
4. Double dispatch.
5. The four statements above imply the following:
   - Utilize polymorphism to allow one class to access another class but not modify its data.
   - For example:
     - Define six classes: `Visitor`, `ConcreteVisitor1`, `ConcreteVisitor2`, `Element`,
       `ConcreteElementA`, and `ConcreteElementB`.
     - `Visitor` and `Element` act as interfaces.
     - `Visitor` provides two pure `virtual` methods that accept pointers to `ConcreteElementA` and
       `ConcreteElementB` as arguments, respectively.
     - `ConcreteVisitor1` and `ConcreteVisitor2` must provide implementations for these two methods.
     - `Element` defines a pure `virtual` `accept` method whose parameter is a `Visitor` pointer
       type, allowing it to receive a `Visitor` subclass object.
     - The client only needs to create instances of the four concrete classes and call the `accept`
       methods of `Element` objects to pass `Visitor` objects to them.
6. [README](https://gitee.com/banana33/design-patterns-cpp/tree/master/visitor).
7. [Code](https://gitee.com/banana33/design-patterns-cpp/blob/master/visitor/Visitor.cpp).
