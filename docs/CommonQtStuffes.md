<!-- vim-markdown-toc GFM -->

- [QT](#qt)
  - [QT Program Requirements or Basics](#qt-program-requirements-or-basics)
  - [QT IOs](#qt-ios)
  - [Model-View-Controller (MVC) in Qt](#model-view-controller-mvc-in-qt)
    - [Architecture](#architecture)
    - [Model](#model)
      - [Explanation](#explanation)
      - [Model Indexes, Rows, Columns and Parents](#model-indexes-rows-columns-and-parents)
      - [Item Roles](#item-roles)
      - [Model Test](#model-test)
    - [View](#view)
      - [Explanation](#explanation-1)
      - [Selections](#selections)
        - [Selection Models](#selection-models)
        - [Selection Objects](#selection-objects)
        - [Create a Selection Object and Submit it to the Selection Model](#create-a-selection-object-and-submit-it-to-the-selection-model)
        - [Selection Commands](#selection-commands)
        - [Selecting all Items in a Model](#selecting-all-items-in-a-model)
    - [Delegates](#delegates)
      - [Explanation](#explanation-2)
      - [Providing an Editor and Submitting Data to the Model](#providing-an-editor-and-submitting-data-to-the-model)
    - [Sorting](#sorting)
    - [Convenience classes](#convenience-classes)
  - [QT Threads](#qt-threads)
  - [QT Widgets (Desktop GUI) (Traditional GUI)](#qt-widgets-desktop-gui-traditional-gui)

<!-- vim-markdown-toc -->

## QT

### QT Program Requirements or Basics

1. [QApplication](https://doc.qt.io/qt-6/qapplication.html).
2. [QObject](https://doc.qt.io/qt-6/qobject.html).
3. [QMetaObject](https://doc.qt.io/qt-6/qmetaobject.html).
4. [Qt Fundamentals](https://doc.qt.io/qt-6/topics-core.html).
5. [Q_OBJECT](https://doc.qt.io/qt-6/qobject.html#Q_OBJECT).
6. [QEvent](https://doc.qt.io/qt-6/qevent.html).
7. [Qt for Linux/X11](https://doc.qt.io/qt-6/linux.html).
8. [Qt for Windows](https://doc.qt.io/qt-6/windows.html).
9. Recommend:
   - The `Q_OBJECT` macro should be used with Qt classes in a header file to avoid unexpected
     behavior.
   - `Q_SIGNALS` and `Q_SLOTS` should be used instead of `signals` and `slots`.
10. The system event delivery sequence:
    - From leaf to root, normally, except for installing a global event filter;
    - The child event filter (`eventFilter(...)`) → The general event function of the child
      (`event(...)`)→ Its parent event filter → The general event function of its parent → Specific
      event functions (event handlers, `xxxEvent(...)`) of its parent and it. (Because their base
      classes' event functions call specific event functions to handle events.)
    - Normally, the event filter intercepts an event and try to process it.
    - However, the general event function does not process an event, instead, it call correspoding
      and specific event functions.
    - Programmers can choose to either reimplement the entire process of the general event function
      or reimplement part of it and call its parent's general event function to handle other events
      or specific event functions to handl specific events.
    - The reimplemented part can process events by itself or by calling user-defined or
      parent-specific functions.
    - In addition, programmers can choose whether and how to reimplement the specific event
      functions, like the general event function.
    - Key concetps: a event filter, a event function, a event handler or a spcific event function.
11. Signals: public method, return void, automatically generated; can't be emitted in a `const`
    method; means that the object's state is changed.
12. Slots: manually written, no limitations except that the number of their parameters must be less
    than or equal to the number of parameters of the connected signal; used to response to the
    signal.

### QT IOs

1. [UI Frameworks](https://doc.qt.io/qt-6/topics-ui.html).
2. [QIODevice](https://doc.qt.io/qt-6/qiodevice.html).
3. [QTextStream](https://doc.qt.io/qt-6/qtextstream.html).
4. [QDataStream](https://doc.qt.io/qt-6/qdatastream.html).
5. [QFile](https://doc.qt.io/qt-6/qfile.html).
6. [QFileInfo](https://doc.qt.io/qt-6/qfileinfo.html).
7. [QDir](https://doc.qt.io/qt-6/qdir.html).
8. [The Qt Resource System](https://doc.qt.io/qt-6/resources.html).
9. Common usages:
   - Use QFile to open a file.
   - Use QTextStream to read or write a file.

### Model-View-Controller (MVC) in Qt

#### Architecture

1. Model: Communicate wit a source of data and provide an interface for the other components.
2. View: Obtain indexes referencing to items of data from the model, retrieve items of data from
   data source and present data to users.
3. Delegate: Render the items of data and modify the items of data.
4. Data: The original data from users.
5. They communicate with each other using signals and slots, except for Data.
   - Signals from the model inform the view about changes to the data held by the data source.
   - Signals from the view provide information about the user's interaction with the items being
     displayed.
   - Signals from the delegate are used during editing to tell the model and view about the state of
     the editor.
6. Item: An object within the model that holds or refers to the data, also providing additional
   information about the data, such as:
   - Display roles: How the data should be displayed (text, icon, color, etc.).
   - Editability: Whether the data can be modified by the user.
   - Hierarchy: The item's position within a tree or other hierarchical structure.
   - Other attributes: Custom data associated with the item.
7. Only the model needs to know how to obtain data, and the type of data managed by the model can be
   defined fairly generally.
8. Flowchart:
   ```mermaid
   flowchart TB
       B -->|Rendering| C
       A[Data] <--> B[Model] <-->|Editing| D((Delegate)) <-->|Rendering| C[View]
   ```

#### Model

##### Explanation

1. [Link](https://doc.qt.io/qt-6/model-view-programming.html#model-classes)
2. Interface: [QAbstractItemModel](https://doc.qt.io/qt-6/qabstractitemmodel.html).
3. Abstract models and proxy models do not store data themselves and rely on implemented methods
   like `data()` and `setData()` to provide and modify the data.
4. The `data()` method also needs to be changed to set fonts, background colour, alignment and a
   checkbox.
5. Item-based models do store data internally.
6. Merely presents an interface that the views use to access the data.
7. Communicate with Data.
8. One model, several views.
9. Ready-made models:
   - [QAbstractListModel](https://doc.qt.io/qt-6/qabstractlistmodel.html): A simple list of items.
     Not store data.
   - [QAbstractTableModel](https://doc.qt.io/qt-6/qabstracttablemodel.html): A simple table of
     items. Not store data.
   - [QStringListModel](https://doc.qt.io/qt-6/qstringlistmodel.html): A simple list of QString
     items. Stores a simple list of strings.
   - [QStandardItemModel](https://doc.qt.io/qt-6/qstandarditemmodel.html): A complex tree structures
     of items. A multi-purpose standard models. Uses `QStandardItem` objects to hold data in a
     tree-like structure. Holding data does not necessarily mean storing the actual data. In many
     cases, it may involve holding a reference (e.g., a pointer) to the data instead.
   - [QFileSystemModel](https://doc.qt.io/qt-6/qfilesystemmodel.html): Provide information about
     files and directories in the local filing system. A standard model. Not hold any items of data
     itself. Asynchronous.
   - [QSqlQueryModel](https://doc.qt.io/qt-6/qsqlquerymodel.html): Access database using model/view
     conventions.
   - [QSqlTableModel](https://doc.qt.io/qt-6/qsqltablemodel.html): Access database using model/view
     conventions.
   - [QSqlRelationalTableModel](https://doc.qt.io/qt-6/qsqlrelationaltablemodel.html): Access
     database using model/view conventions.
10. Custom models: Subclass these model classes.
11. All subclasses of `QAbstractItemModel` represent the data as a hierarchical structure containing
    tables of items.
12. Views use this convention to access items of data in the model.
13. Use signals and slots mechanism to inform any attached views about data changes.
14. [Model subclassing reference](https://doc.qt.io/qt-6/model-view-programming.html#model-subclassing-reference).
15. [Qt::ItemFlag](https://doc.qt.io/qt-6/qt.html#ItemFlag-enum) describes the properties of an
    item.

##### Model Indexes, Rows, Columns and Parents

1. Each piece of information that can be obtained via a model is represented by a model index.
2. Views and delegates use these indexes to request items of data to display.
3. Contain a pointer to the model that created them.
4. Provide references to pieces of information:
   - A long-term reference, a persistent model index, the model keeps the information up-to-date,
     created by [QPersistentModelIndex](https://doc.qt.io/qt-6/qpersistentmodelindex.html).
   - A temporary reference, created by [QModelIndex](https://doc.qt.io/qt-6/qmodelindex.html).
   - Three properties(arguments) : a row number, a column number and the model index of a parent
     item.
   - `QAbstractItemModel::index( row, column, parent )`.
   - `QAbstractItemModel::index( row, column, QModelIndex() )` returns top level items.
   - If a valid model index is specified for the parent item when an index is requested using
     `index()`, the index returned refers to an item beneath that parent item in the model. The
     index obtained refers to a child of that item.
   - If an invalid model index is specified for the parent item when an index is requested using
     `index()`, the index returned refers to a top-level item in the model.
5. Used to retrieve or modify data via the model.
6. May become invalid and should not be stored.
7. Can retrieve information about any given item by specifying its row and column numbers to the
   model and receive an index that represents the item.
8. Form top-level indexes to bottom-level indexes like finding a director manually.
9. `setModel()` automatically connect the `dataChanged()` signal to the view.

##### Item Roles

1. One item, several roles.
2. One role, one data type, one situation.
3. The standard roles are defined by
   [Qt::ItemDataRole](https://doc.qt.io/qt-6/qt.html#ItemDataRole-enum).
4. `QVariant value = QAbstractItemModel::data( index, role )`. Retrieve item's data.
5. By supplying appropriate item data for each role, models can provide hints to views and delegates
   about how items should be presented to the user.

##### Model Test

1. [Model test](https://wiki.qt.io/Model_Test).

#### View

##### Explanation

1. [Link](https://doc.qt.io/qt-6/model-view-programming.html#view-classes)
2. Interface: [QAbstractItemView](https://doc.qt.io/qt-6/qabstractitemview.html).
3. Not store data.
4. Retrieve items of data from the model and present data to the users.
5. Manage the lifetime of the editor and the overall layout of the data obtained from models.
6. Provide default editing facilities for items, or work with a delegate to provide a custom editor.
7. Render individual items of data themselves, or use delegates to handle both rendering and editing
   features.
8. Can keep track of the selected items with selections.
9. The selections can be maintained separately for each view, or shared between multiple views.
10. One selections, several views.
11. Some views display headers as well as items.
    [QAbstractItemModel::headerData()](https://doc.qt.io/qt-6/qabstractitemmodel.html#headerData)
    and [QHeaderView](https://doc.qt.io/qt-6/qheaderview.html).
12. Ready-made views:
    - [QListView](https://doc.qt.io/qt-6/qlistview.html): Display items from a model as a simple
      list, or in the form of a classic icon view. The most suitable views to use with
      QFileSystemModel.
    - [QTreeView](https://doc.qt.io/qt-6/qtreeview.html): Show model items of data in a hierarchical
      list, allowing deeply nested structures to be represented in a compact way. The most suitable
      views to use with QFileSystemModel.
    - [QTableView](https://doc.qt.io/qt-6/qtableview.html): Display data from a model in a table.
13. Custom views: Subclass these view classes.

##### Selections

###### Selection Models

1. All of the standard views construct their own selection models by default, and interact with them
   in the normal way.
2. [QAbstractItemView::selectionModel()](https://doc.qt.io/qt-6/qabstractitemview.html#selectionModel)
   returns a selection model of the view.
3. [QAbstractItemView::setSelectionModel()](https://doc.qt.io/qt-6/qabstractitemview.html#setSelectionModel)
   is used to replace the original selection model of the view.
4. One selection model, several views, sharing selections among views.
5. Information about the items selected in a view is stored in an instance of the
   `QItemSelectionModel` class that is a record of the selection state of all the items in an item
   model (selected or deselected).
6. This maintains model indexes for items in a single model, and is independent of any views.
7. `const QModelIndexList indexes = selectionModel->selectedIndexes();` returns an unsorted list of
   model indexes.
8. Emits [selectionChanged()](https://doc.qt.io/qt-6/qitemselectionmodel.html#selectionChanged)
   signals to indicate changes in the selection.
9. Two arguments in `selectionChanged()`: two `QItemSelection` objects
   - one contains a list of indexes that correspond to newly selected items;
   - the other contains indexes that correspond to newly deselected items.
10. [currentChanged()](https://doc.qt.io/qt-6/qitemselectionmodel.html#currentChanged):
    - A signal used to keep track of the currently focused item;
    - Two arguments or model indexes: the previously focused item, and the currently focused item.

###### Selection Objects

1. Applied to a collection of model indexes held by a selection model.
2. The most recent selection of items applied is known as the current selection.
3. Made up of selection ranges: Recording only the starting(topLeft) and ending(bottomRight) model
   indexes for each range of selected items
4. One contiguous selection, one selection object, one selection range, two model indexes.
5. One non-contiguous selection, multiple selection object, multiple selection ranges, multiple
   model indexes.
6. Two independent states: A current item and a selected item.
7. A selection is created by specifying a model, and a pair of model indexes to a
   [QItemSelection](https://doc.qt.io/qt-6/qitemselection.html). Its selection range is always from
   the top-left to bottom-right.
8. Only `QItemSelection` is used to create a selection object.
9. `const QModelIndexList indexes = selectionModel->selectedIndexes();` is used to get the selected
   indexes.
10. [Selection flags](https://doc.qt.io/qt-6/qitemselectionmodel.html#SelectionFlag-enum).

###### Create a Selection Object and Submit it to the Selection Model

```CPP
QModelIndex topLeft = model->index( row1, column1, parent1 );
QModelIndex bottomRight = model->index( row2, column2, parent2 );
QItemSelection selection( topLeft, bottomRight );
selectionModel->select( selection, QItemSelectionModel::Select /* selection flags */);
```

###### Selection Commands

1. [Selection flags](https://doc.qt.io/qt-6/qitemselectionmodel.html#SelectionFlag-enum).
2. Are provided by a combination of selection flags.
3. By default, the selection commands only operate on the individual items specified by the model
   indexes.
4. However, the flag used to describe the selection command can be combined with additional flags to
   change entire rows and columns.
5. The results of slection commands are accumlated.
6. This means the results of subsequent commands depend on the results of previous commands because
   the selection states of all items are stored in the same selection model.

###### Selecting all Items in a Model

1. Need to create a selection for each level of the model that covers all items in that level.
2. Need to be performed for all levels in the model:
   ```CPP
   QItemSelection selection( topLeft, bottomRight );
   selectionModel->select( selection, QItemSelectionModel::Select );
   ```
3. For hierarchical models, the
   [hasChildren()](https://doc.qt.io/qt-6/qabstractitemmodel.html#hasChildren) function is used to
   determine whether any given item is the parent of another level of items.

#### Delegates

##### Explanation

1. [Link](https://doc.qt.io/qt-6/model-view-programming.html#delegate-classes)
2. Interface: [QAbstractItemDelegates](https://doc.qt.io/qt-6/qabstractitemdelegate.html).
3. Not store data.
4. Not manage the lifetime of the editor and store an editor.
5. Paint and provide editors for items in view.
6. Provide input capabilities and are also responsible for rendering individual items in some views.
7. Two methods are used to implement editors for delegates:
   - Use widgets to manage the editing process. Need to install a default event filter supplied by
     `QStyledItemDelegate` or a custom event filter.
   - Provide our own editor widget to handle events directly. Not need a event filter.
8. Note that no editor widgets are set up when the delegate is constructed. We only construct an
   editor widget when it is needed.
9. The default delegate instance in standard views: QStyledItemDelegate.
10. [QAbstractItemView::itemDelegate](https://doc.qt.io/qt-6/qabstractitemview.html#itemDelegate)
    returns a delegate that the view is using.
11. [QAbstractItemView::setItemDelegate](https://doc.qt.io/qt-6/qabstractitemview.html#setItemDelegate)
    installs or sets a delegate for a view.
12. Ready-made delegates:
    - [QStyledItemDelegate](https://doc.qt.io/qt-6/qstyleditemdelegate.html): Default delegates. Use
      the current style to paint items. With some default display functions.
    - [QItemDelegate](https://doc.qt.io/qt-6/qitemdelegate.html).
13. Custom delegates: Subclass these delegate classes and work with editor widgets.
14. Delegates are expected to be able to render their contents themselves by implementing the
    `paint()` and `sizeHint()` functions.
15. Need to implement the following four functions:
    ```CPP
    QWidget* createEditor( QWidget* parent,
                           const QStyleOptionViewItem& option,
                           const QModelIndex& index ) const override;
    void setEditorData( QWidget* editor, const QModelIndex& index ) const override;
    void setModelData( QWidget* editor,
                       QAbstractItemModel* model,
                       const QModelIndex& index ) const override;
    void updateEditorGeometry( QWidget* editor,
                               const QStyleOptionViewItem& option,
                               const QModelIndex& index ) const override;
    ```

##### Providing an Editor and Submitting Data to the Model

    ```mermaid
    flowchart LR
        C[User] -->|Edit data| A[View]
        A -->|Request an editor| B((Delegate))
        B -->|Check whether the item is editable, create an editor and transfer the ownership| A
        A -->|Request setting the data of the editor| B
        B -->|Set the data of the editor| A
        A -->|Request storing the edited data of the editor| B
        B -->|Request storing the data| D[Mode]
        D -->|Store the data and emit dataChanged signal| A
        D -->|Store the data and emit dataChanged signal| B
        B -->|Emit the closeEditor signal with a suitable hint like EditNextItem| A
        A -->|Close and destory| E[Editor]
    ```

#### Sorting

1. Reimplments the `QAbstractItemModel::sort()` function:
   - Enable interactive sorting(i.e. allowing the users to sort the data by clicking the view's
     headers).
   - Connecting the `QHeaderView::sortIndicatorChanged()` signal to the `QTableView::sortByColumn()`
     slot or the `QTreeView::sortByColumn()` slot, respectively.
2. Use [Proxy Model](https://doc.qt.io/qt-6/model-view-programming.html#proxy-models).

#### Convenience classes

1. Not intended to be subclassed.
2. Derived from the standard view classes.
3. An item-based set of classes.
4. Can replace View.
5. Not recommend using these classes to replace View.
6. Instead, using view classes, such as `QListView`, `QTableView`, and `QTreeView` with
   `QStandardItemModel`.
7. Cannot be used with arbitrary models.
8. [QListWidget](https://doc.qt.io/qt-6/qlistwidget.html).
9. [QTreeWidget](https://doc.qt.io/qt-6/qtreewidget.html).
10. [QTableWidget](https://doc.qt.io/qt-6/qtablewidget.html).

### QT Threads

1. The "main thread" is the thread created when a program starts.
2. In Qt applications, this thread is also known as the "GUI thread".
3. Other threads are referred to as "worker threads" or "secondary threads".
4. All widgets and several related classes must operate in the "main thread" and do not work in
   secondary threads.
5. Each thread has its own stack but shares the same address space.
6. `QThread` by itself does not automatically start an event loop in the new thread.
7. You have to explicitly call `exec()` within the `run()` method of your `QThread` subclass to
   start one.
8. To execute methods in a new thread, the following requirements must be met::
   - Use the worker-object approach;
   - All methods intended for execution in the new thread must be slots of the worker object;
   - Use `connect(this, &Controller::operate, worker, &Worker::slot);` to connect the signal and
     slot.

### QT Widgets (Desktop GUI) (Traditional GUI)

1. [QWidget]().
2. [QFrame]().
3. [QGridLayout]().
4. [QLabel]().
5. [QPushButton]().
6. [connect]().
7. [QMainWindow]().
8. [QAction]().
9. [QPixmap]().
10. [QVBoxLayout]().
11. [QHBoxLayout]().
12. [QListWidget]().
13. [QGridLayout]().
14. [QLineEdit]().
15. [QFormLayout]().
16. [QLabel]().
17. [QTextEdit]().
18. [QKeyEvent]().
19. [QCheckBox]().
