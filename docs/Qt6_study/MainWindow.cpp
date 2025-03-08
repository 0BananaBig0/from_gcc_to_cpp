////////////////////////////////////////////////////////////////////////////////
///                        File Name: MainWindow.cpp                         ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang633@163.com                         ///
///                         12/17/2024-Tue-15:51:39                          ///
////////////////////////////////////////////////////////////////////////////////

#include "MainWindow.h"
#include <QDebug>
#include <QDockWidget>
#include <QIcon>
#include <QListWidget>
#include <QMenu>
#include <QMenuBar>
#include <QToolBar>
#include <QStringList>

MainWindow::MainWindow( QWidget* parent ): QMainWindow( parent ) {

   _mainMenuBar = menuBar();
   createFileActions();
   createFileMenu();
   createColorSchemeMenu();
   createDockWidget();
   createToolBar();
   createViewActions();
   createViewMenu();
   createFloatingActions();
   createFloatingMenu();
}

void MainWindow::createFileActions() {
   _newFile
      = new QAction( QIcon::fromTheme( ":/document-new" ), "&New File", this );
   _saveFile = new QAction( QIcon::fromTheme( ":/document-save" ),
                            "&Save File",
                            this );
   _quit = new QAction(
      QIcon::fromTheme( ":/images/application-exit-symbolic.svg" ),
      "&Quit",
      this );
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
      = _fileMenu->addMenu( QIcon( ":/color-scheme" ), "&Color Scheme" );
   _fileMenu->insertMenu( _quit, _colorSchemeMenu );
   _fileMenu->insertSeparator( _quit );
}

void MainWindow::createDockWidget() {
   _dockWidget = new QDockWidget( tr( "Table of Contents" ), this );
   _dockWidget->setAllowedAreas( Qt::LeftDockWidgetArea
                                 | Qt::RightDockWidgetArea );
   addDockWidget( Qt::LeftDockWidgetArea, _dockWidget );
   setCorner( Qt::TopLeftCorner, Qt::LeftDockWidgetArea );
   _dockContent = new QTextEdit( _dockWidget );
   _dockContent->setText( "Dock Content" );
   _dockWidget->setWidget( _dockContent );
   _dockWidget->setStyleSheet( "QDockWidget { border: 2px solid red; }" );
   _dockWidget->setFixedSize( 300, 200 );
   resizeDocks( QList< QDockWidget* >{ _dockWidget },
                QList< int >{ 200 },
                Qt::Vertical );
   connect( _dockWidget,
            &QDockWidget::visibilityChanged,
            this,
            &MainWindow::setShowOrHideDockIcon );
   connect( _dockWidget,
            &QDockWidget::topLevelChanged,
            this,
            &MainWindow::setToggleFloatingDockIcon );
}

void MainWindow::createViewActions() {
   _showOrHideToolBar = _toolBar->toggleViewAction();
   _showOrHideToolBar->setText( "&Tool Bar" );
   _showOrHideDock = _dockWidget->toggleViewAction();
   _showOrHideDock->setText( "&Dock" );
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
   connect( _toolBar,
            &QToolBar::visibilityChanged,
            this,
            &::MainWindow::setShowOrHideToolBarIcon );
}

void MainWindow::setShowOrHideToolBarIcon() {
   if( _toolBar->isVisible() ) {
      _showOrHideToolBar->setIcon( QIcon( ":/view-conceal" ) );
   } else {
      _showOrHideToolBar->setIcon( QIcon( ":/view" ) );
   }
}

void MainWindow::setShowOrHideDockIcon() {
   if( _dockWidget->isVisible() ) {
      _showOrHideDock->setIcon( QIcon( ":/view-conceal" ) );
   } else {
      _showOrHideDock->setIcon( QIcon( ":/view" ) );
   };
}

void MainWindow::toggleFloatingDock() {
   if( _dockWidget->isFloating() ) {
      _dockWidget->setFloating( false );
   } else {
      _dockWidget->setFloating( true );
   };
}

void MainWindow::setToggleFloatingDockIcon() {
   if( _dockWidget->isFloating() ) {
      _toggleFloatingDock->setIcon( QIcon( ":/view-conceal" ) );
   } else {
      _toggleFloatingDock->setIcon( QIcon( ":/view" ) );
   };
}

