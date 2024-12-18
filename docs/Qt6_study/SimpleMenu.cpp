/*************************************************************************
  > File Name: SimpleMenu.cpp
  > Author: Huaxiao Liang
  > Mail: 1184903633@qq.com
  > Created Time: Tue 17 Dec 2024 01:17:08 PM CST
 ************************************************************************/

#include <QMenu>
#include <QMenuBar>
#include "SimpleMenu.h"

SimpleMenu::SimpleMenu( QWidget* parent ): QMainWindow( parent ) {
   auto* quit = new QAction( "&Quit", this );
   QMenu* file = menuBar()->addMenu( "&File" );
   file->addAction( quit );
   connect( quit, &QAction::triggered, qApp, QApplication::quit );
}
