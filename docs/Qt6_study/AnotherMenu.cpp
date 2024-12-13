/*************************************************************************
  >
 * File Name: AnotherMenu.cpp
  > Author: Huaxiao Liang
  > Mail:
 * 1184903633@qq.com
  > Created Time: Tue 17 Dec 2024 03:51:39 PM CST
 * ************************************************************************/
#include <QMenu>
#include <QMenuBar>
#include <QIcon>
#include "AnotherMenu.h"
#include <QDebug>

AnotherMenu::AnotherMenu( QWidget* parent ): QMainWindow( parent ) {
   // auto* newa = new QAction( QIcon::fromTheme( "document-new" ), "&New", this
   // ); auto* open
   //    = new QAction( QIcon::fromTheme( "document-open" ), "&Open", this );
   // auto* quit
   //    = new QAction( QIcon::fromTheme( "application-exit" ), "&Quit", this );

   auto* newa = new QAction( QIcon::fromTheme( "document-new" ).isNull()
                                ? QIcon( ":/icons/document-new.png" )
                                : QIcon::fromTheme( "document-new" ),
                             "&New",
                             this );
   auto* open = new QAction( QIcon::fromTheme( "application-exit" ).isNull()
                                ? QIcon( ":/icons/document-open.png" )
                                : QIcon::fromTheme( "document-open" ),
                             "&Open",
                             this );
   auto* quit = new QAction( QIcon::fromTheme( "application-exit" ).isNull()
                                ? QIcon( ":icons/application-exit.png" )
                                : QIcon::fromTheme( "application-exit" ),
                             "&Quit",
                             this );
   quit->setShortcut( tr( "CTRL+Q" ) );
   QMenu* file = menuBar()->addMenu( "&File" );
   file->addAction( newa );
   file->addAction( open );
   file->addSeparator();
   file->addAction( quit );
   connect( quit, &QAction::triggered, qApp, &QApplication::quit );
}
