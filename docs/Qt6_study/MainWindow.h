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

class MainWindow: public QMainWindow {
      Q_OBJECT

   public:
      MainWindow( QWidget* parent = nullptr );

   private:
      QMenuBar* _mainMenuBar;
      QMenu* _mainMenuFile;
      QAction* _newFile;
      QAction* _saveFile;
      QAction* _quit;

      QMenu* _colorSchemeMenu;

      QToolBar* _toolBar;

      QDockWidget* _dockWidget;
      QListWidget* _dockHeadingList;
   private Q_SLOTS:
      void createMainMenuFileActions();
      void createMainMenuFile();
      void createColorSchemeMenu();
      void createToolBar();
      void createDockWidget();
};
