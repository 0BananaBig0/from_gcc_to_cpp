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
#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QDebug>

class MainWindow: public QMainWindow {
      Q_OBJECT

   public:
      MainWindow( QWidget* parent = nullptr );
      ~MainWindow() override;
      // Restore the app's states.
      void readJsonFile();
      // Store the app's states.
      void updateJsonFile();

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

      const QString _filePath;
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
      void closeEvent( QCloseEvent* event ) override;
};

