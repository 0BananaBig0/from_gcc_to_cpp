/*************************************************************************
  >
 * File Name: MainWindow.cpp
  > Author: Huaxiao Liang
  > Mail:
 * 1184903633@qq.com
  > Created Time: Tue 17 Dec 2024 03:51:39 PM CST
 * ************************************************************************/
#include "MainWindow.h"
#include <QMenu>
#include <QMenuBar>
#include <QIcon>
#include <QDebug>
#include <QDockWidget>
#include <QListWidget>
#include <QToolBar>
#include <QDockWidget>
#include <QListWidget>

MainWindow::MainWindow( QWidget* parent ): QMainWindow( parent ) {

   _mainMenuBar = menuBar();
   createMainMenuFileActions();
   createMainMenuFile();
   createColorSchemeMenu();
   createToolBar();
   createDockWidget();
}

void MainWindow::createMainMenuFileActions() {
   _newFile
      = new QAction( QIcon::fromTheme( "document-new" ), "&New File", this );
   _saveFile
      = new QAction( QIcon::fromTheme( "document-save" ), "&Save File", this );
   _quit = new QAction( QIcon::fromTheme( "application-exit" ), "&Quit", this );
   _quit->setShortcut( tr( "CTRL+Q" ) );
   connect( _quit, &QAction::triggered, qApp, &QApplication::quit );
}

void MainWindow::createMainMenuFile() {
   _mainMenuFile = _mainMenuBar->addMenu( "&File" );
   _mainMenuFile->addAction( _newFile );
   _mainMenuFile->addAction( _saveFile );
   _mainMenuFile->addSeparator();
   _mainMenuFile->addAction( _quit );
}

void MainWindow::createColorSchemeMenu() {
   _colorSchemeMenu = _mainMenuFile->addMenu(
      QIcon( "/usr/share/icons/Adwaita/scalable/legacy/"
             "preferences-color-symbolic.svg" ),
      "&Color Scheme" );
   _mainMenuFile->insertMenu( _quit, _colorSchemeMenu );
   _mainMenuFile->insertSeparator( _quit );
}

void MainWindow::createToolBar() {
   _toolBar = addToolBar( tr( "File" ) );
   _toolBar->setAllowedAreas( Qt::TopToolBarArea | Qt::BottomToolBarArea );
   _toolBar->addAction( _newFile );
   _toolBar->addAction( _saveFile );
   _toolBar->addSeparator();
   _toolBar->addAction( _quit );
   addToolBar( Qt::TopToolBarArea, _toolBar );
}

void MainWindow::createDockWidget() {
   _dockWidget = new QDockWidget( tr( "Table of Contents" ), this );
   _dockWidget->setAllowedAreas( Qt::LeftDockWidgetArea
                                 | Qt::RightDockWidgetArea );
   addDockWidget( Qt::LeftDockWidgetArea, _dockWidget );
   setCorner( Qt::TopLeftCorner, Qt::LeftDockWidgetArea );
   _dockHeadingList = new QListWidget( _dockWidget );
   _dockWidget->setWidget( _dockHeadingList );
}
