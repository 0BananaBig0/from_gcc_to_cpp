/*************************************************************************
  > File Name: MainWindow.h
  > Author: Huaxiao Liang
  > Mail: 1184903633@qq.com
  > Created Time: Tue 17 Dec 2024 03:51:59 PM CST
 ************************************************************************/
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
   private Q_SLOTS:
      void setShowOrHideToolBarIcon();
      void setShowOrHideDockIcon();
      void toggleFloatingDock();
      void setToggleFloatingDockIcon();

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
