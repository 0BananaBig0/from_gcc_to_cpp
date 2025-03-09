////////////////////////////////////////////////////////////////////////////////
///                        File Name: MainWindow.cpp                         ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang633@163.com                         ///
///                         12/17/2024-Tue-15:51:39                          ///
////////////////////////////////////////////////////////////////////////////////

#include "MainWindow.h"
#include <QFile>
#include <QFileDialog>
#include <QMessageBox>
#include <QTextStream>
#include <QDebug>
#include <QDockWidget>
#include <QIcon>
#include <QListWidget>
#include <QMenu>
#include <QMenuBar>
#include <QToolBar>
#include <QStringList>

MainWindow::MainWindow( QWidget* parent ):
   QMainWindow( parent ),
   _filePath( "/home/banana/from_gcc_to_cpp/docs/Qt6_study/WinSettings.json" ) {

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
   readJsonFile();
}

MainWindow::~MainWindow() {
   // Their parent is responsible for deleting them.
   // delete _mainMenuBar;

   // delete _fileMenu;
   // delete _newFile;
   // delete _openFile;
   // delete _saveFile;
   // delete _quit;
   // delete _colorSchemeMenu;

   // delete _dockWidget;
   // delete _dockContent;
   // delete _viewMenu;
   // delete _showOrHideToolBar;
   // delete _showOrHideDock;

   // delete _floatingMenu;
   // delete _toggleFloatingDock;

   // delete _toolBar;
};

void MainWindow::createFileActions() {
   _newFile
      = new QAction( QIcon::fromTheme( ":/document-new" ), "&New File", this );
   _openFile = new QAction( QIcon::fromTheme( ":/document-open" ),
                            "&Open File",
                            this );
   _saveFile = new QAction( QIcon::fromTheme( ":/document-save" ),
                            "&Save File",
                            this );
   _quit = new QAction(
      QIcon::fromTheme( ":/images/application-exit-symbolic.svg" ),
      "&Quit",
      this );
   _quit->setShortcut( tr( "CTRL+Q" ) );
   connect( _newFile, &QAction::triggered, this, &MainWindow::newDocument );
   connect( _openFile, &QAction::triggered, this, &MainWindow::open );
   connect( _saveFile, &QAction::triggered, this, &MainWindow::save );
   connect( _quit, &QAction::triggered, qApp, &QApplication::quit );
}

void MainWindow::createFileMenu() {
   _fileMenu = _mainMenuBar->addMenu( "&File" );
   _fileMenu->addAction( _newFile );
   _fileMenu->addAction( _openFile );
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
   _dockWidget = new QDockWidget( this );
   _dockWidget->setAllowedAreas( Qt::LeftDockWidgetArea
                                 | Qt::RightDockWidgetArea );
   _dockWidget->setFeatures( QDockWidget::DockWidgetClosable
                             | QDockWidget::DockWidgetMovable
                             | QDockWidget::DockWidgetFloatable );
   addDockWidget( Qt::LeftDockWidgetArea, _dockWidget );
   setCorner( Qt::TopLeftCorner, Qt::LeftDockWidgetArea );
   _dockContent = new QTextEdit( _dockWidget );
   _dockContent->setText( "Open a file or New a file" );
   _dockWidget->setWidget( _dockContent );
   _dockWidget->setStyleSheet( "QDockWidget { border: 2px solid red; }" );
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
   setShowOrHideToolBarIcon();
   setShowOrHideDockIcon();
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
   setToggleFloatingDockIcon();
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

void MainWindow::newDocument() {
   _currentFile.clear();
   _dockContent->setText( QString() );
}

void MainWindow::open() {
   QString file_name = QFileDialog::getOpenFileName( this, "Open the file" );
   if( file_name.isEmpty() ) {
      return;
   }
   QFile file( file_name );
   _currentFile = file_name;
   if( !file.open( QIODevice::ReadOnly | QFile::Text ) ) {
      QMessageBox::warning( this,
                            "Warning",
                            "Cannot open file: " + file.errorString() );
      return;
   }
   setWindowTitle( file_name );
   QTextStream in( &file );
   QString text = in.readAll();
   _dockContent->setText( text );
   file.close();
}

void MainWindow::save() {
   QString file_name;
   // If we don't have a filename from before, get one.
   if( _currentFile.isEmpty() ) {
      file_name = QFileDialog::getSaveFileName( this, "Save" );
      if( file_name.isEmpty() ) {
         return;
      }
      _currentFile = file_name;
   } else {
      file_name = _currentFile;
   }
   QFile file( file_name );
   if( !file.open( QIODevice::WriteOnly | QFile::Text ) ) {
      QMessageBox::warning( this,
                            "Warning",
                            "Cannot save file: " + file.errorString() );
      return;
   }
   setWindowTitle( file_name );
   QTextStream out( &file );
   QString text = _dockContent->toPlainText();
   out << text;
   file.close();
}

void MainWindow::readJsonFile() {
   QFile file( _filePath );
   if( !file.open( QIODevice::ReadOnly | QIODevice::Text ) ) {
      qWarning() << "Failed to open file:" << _filePath;
      return;
   }

   QByteArray json_data = file.readAll();
   file.close();

   QJsonDocument doc = QJsonDocument::fromJson( json_data );
   if( doc.isNull() ) {
      qWarning() << "Failed to parse JSON.";
      return;
   }

   QJsonObject json_obj = doc.object();
   resize( json_obj["width"].toInt(), json_obj["height"].toInt() );
   move( json_obj["x"].toInt(), json_obj["y"].toInt() );
   _dockWidget->setVisible( json_obj["show_dock"].toBool() );
   _toolBar->setVisible( json_obj["show_tool_bar"].toBool() );
   _dockWidget->setFloating( json_obj["float_dock"].toBool() );
}

void MainWindow::updateJsonFile() {
   QFile file( _filePath );
   if( !file.open( QIODevice::ReadOnly | QIODevice::Text ) ) {
      qWarning() << "Failed to open file:" << _filePath;
      return;
   }

   QByteArray json_data = file.readAll();
   file.close();

   QJsonDocument doc = QJsonDocument::fromJson( json_data );
   if( doc.isNull() ) {
      qWarning() << "Failed to parse JSON.";
      return;
   }

   QJsonObject json_obj = doc.object();

   // Update values
   const QSize& win_size = size();
   const QPoint& win_pos = pos();
   json_obj["width"] = win_size.width();
   json_obj["height"] = win_size.height();
   json_obj["x"] = win_pos.x();
   json_obj["y"] = win_pos.y();
   json_obj["show_dock"] = _dockWidget->isVisible();
   json_obj["show_tool_bar"] = _toolBar->isVisible();
   json_obj["float_dock"] = _dockWidget->isFloating();

   // Save the updated JSON back to the file
   QFile save_file( _filePath );
   if( !save_file.open( QIODevice::WriteOnly | QIODevice::Text ) ) {
      qWarning() << "Failed to open file for writing:" << _filePath;
      return;
   }

   QJsonDocument updated_doc( json_obj );
   save_file.write( updated_doc.toJson() );
   save_file.close();

   qDebug() << "JSON file updated successfully.";
}

void MainWindow::closeEvent( QCloseEvent* event ) {
   // Custom logic before closing the window
   qDebug() << "Window is about to close.";
   updateJsonFile();
   QWidget::closeEvent( event );
}

