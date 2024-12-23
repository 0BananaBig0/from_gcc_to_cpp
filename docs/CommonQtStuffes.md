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
      event functions (event handlers, `xxxEvent(...)`) of its parent and it.
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
