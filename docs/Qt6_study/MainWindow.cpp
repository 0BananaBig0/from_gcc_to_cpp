/*************************************************************************
  >
 * File Name: MainWindow.cpp
  > Author: Huaxiao Liang
  > Mail:
 * 1184903633@qq.com
  > Created Time: Tue 17 Dec 2024 03:51:39 PM CST
 * ************************************************************************/
#include "MainWindow.h"
#include <QDebug>
#include <QDockWidget>
#include <QIcon>
#include <QListWidget>
#include <QMenu>
#include <QMenuBar>
#include <QToolBar>

MainWindow::MainWindow( QWidget* parent ): QMainWindow( parent ) {

   _mainMenuBar = menuBar();
   createFileActions();
   createFileMenu();
   createColorSchemeMenu();
   createDockWidget();
   createViewActions();
   createViewMenu();
   createFloatingActions();
   createFloatingMenu();
   createToolBar();
}

void MainWindow::createFileActions() {
   _newFile
      = new QAction( QIcon::fromTheme( "document-new" ), "&New File", this );
   _saveFile
      = new QAction( QIcon::fromTheme( "document-save" ), "&Save File", this );
   _quit = new QAction( QIcon::fromTheme( "application-exit" ), "&Quit", this );
   _quit->setShortcut( tr( "CTRL+Q" ) );
   connect( _quit, &QAction::triggered, qApp, &QApplication::quit );
}

void MainWindow::createFileMenu() {
   _fileMenu = _mainMenuBar->addMenu( "&File" );
   _fileMenu->addAction( _newFile );
   _fileMenu->addAction( _saveFile );
   _fileMenu->addSeparator();
   _fileMenu->addAction( _quit );
}

void MainWindow::createColorSchemeMenu() {
   _colorSchemeMenu
      = _fileMenu->addMenu( QIcon( "/usr/share/icons/Adwaita/scalable/legacy/"
                                   "preferences-color-symbolic.svg" ),
                            "&Color Scheme" );
   _fileMenu->insertMenu( _quit, _colorSchemeMenu );
   _fileMenu->insertSeparator( _quit );
}

void MainWindow::createDockWidget() {
   _dockWidget = new QDockWidget( tr( "Table of Contents" ), this );
   _dockWidget->setAllowedAreas( Qt::LeftDockWidgetArea
                                 | Qt::RightDockWidgetArea );
   addDockWidget( Qt::LeftDockWidgetArea, _dockWidget );
   setCorner( Qt::TopLeftCorner, Qt::LeftDockWidgetArea );
   _dockHeadingList = new QListWidget( _dockWidget );
   _dockWidget->setWidget( _dockHeadingList );
   _dockWidget->setStyleSheet( "QDockWidget { border: 2px solid red; }" );
   resizeDocks( QList< QDockWidget* >{ _dockWidget },
                QList< int >{ 200 },
                Qt::Vertical );
}

void MainWindow::createViewActions() {
   _showOrHideToolBar
      = new QAction( QIcon::fromTheme( "bookmark-new" ), "&Tool Bar", this );
   _showOrHideDock
      = new QAction( QIcon::fromTheme( "bookmark-new" ), "&Dock", this );
   connect( _showOrHideToolBar,
            &QAction::triggered,
            this,
            &MainWindow::showOrHideToolBar );
   connect( _showOrHideDock,
            &QAction::triggered,
            this,
            &MainWindow::showOrHideDock );
}

void MainWindow::createViewMenu() {
   _viewMenu = _mainMenuBar->addMenu( "&View" );
   _viewMenu->addAction( _showOrHideToolBar );
   _viewMenu->addAction( _showOrHideDock );
}

void MainWindow::createFloatingActions() {
   _toggleFloatingDock = new QAction( "&Floating Dock", this );
   connect( _toggleFloatingDock,
            &QAction::triggered,
            this,
            &MainWindow::toggleFloatingDock );
}

void MainWindow::createFloatingMenu() {
   _floatingMenu = _mainMenuBar->addMenu( "&Floating" );
   _floatingMenu->addAction( _toggleFloatingDock );
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

void MainWindow::showOrHideToolBar() {
   if( _toolBar->isVisible() ) {
      _showOrHideToolBar->setIcon( QIcon() );
      _toolBar->setVisible( false );
   } else {
      _showOrHideToolBar->setIcon( QIcon::fromTheme( "bookmark-new" ) );
      _toolBar->setVisible( true );
   }
}

void MainWindow::showOrHideDock() {
   if( _dockWidget->isVisible() ) {
      _showOrHideDock->setIcon( QIcon() );
      _dockWidget->setVisible( false );
   } else {
      _showOrHideDock->setIcon( QIcon::fromTheme( "bookmark-new" ) );
      _dockWidget->setVisible( true );
   }
}

void MainWindow::toggleFloatingDock() {
   if( _dockWidget->isFloating() ) {
      _toggleFloatingDock->setIcon( QIcon() );
      _dockWidget->setFloating( false );
   } else {
      _toggleFloatingDock->setIcon( QIcon::fromTheme( "bookmark-new" ) );
      _dockWidget->setFloating( true );
   }
}
