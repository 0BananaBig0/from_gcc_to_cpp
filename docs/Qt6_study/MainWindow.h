////////////////////////////////////////////////////////////////////////////////
///                         File Name: MainWindow.h                          ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang633@163.com                         ///
///                         12/17/2024-Tue-15:51:59                          ///
////////////////////////////////////////////////////////////////////////////////

#pragma once
#include <QMainWindow>
#include <QApplication>
#include <QListWidget>
#include <QDockWidget>
#include <QTextEdit>

class MainWindow: public QMainWindow {
      Q_OBJECT

   public:
      MainWindow( QWidget* parent = nullptr );

   private:
      QMenuBar* _mainMenuBar;

      QMenu* _fileMenu;
      QAction* _newFile;
      QAction* _openFile;
      QAction* _saveFile;
      QAction* _quit;
      QMenu* _colorSchemeMenu;

      QDockWidget* _dockWidget;
      QTextEdit* _dockContent;
      QMenu* _viewMenu;
      QAction* _showOrHideToolBar;
      QAction* _showOrHideDock;

      QMenu* _floatingMenu;
      QAction* _toggleFloatingDock;

      QToolBar* _toolBar;
      QString _currentFile;
   private Q_SLOTS:
      void setShowOrHideToolBarIcon();
      void setShowOrHideDockIcon();
      void toggleFloatingDock();
      void setToggleFloatingDockIcon();
      void newDocument();
      void open();
      void save();

   private:
      void createFileActions();
      void createFileMenu();
      void createColorSchemeMenu();
      void createDockWidget();
      void createViewActions();
      void createViewMenu();
      void createFloatingActions();
      void createFloatingMenu();
      void createToolBar();
};

