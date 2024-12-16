#include "Basic.h"
#include <QApplication>

int main( int argc, char* argv[] ) {
   QApplication app( argc, argv );
   ParentEventFilter pfilter;
   ParentWidget pwindow;
   pwindow.installEventFilter( &pfilter );
   ChildEventFilter cfilter;
   ChildWidget cwindow( &pwindow );
   cwindow.installEventFilter( &cfilter );
   pwindow.resize( 1200, 600 );
   cwindow.resize( 600, 1200 );
   pwindow.show();
   cwindow.show();

   return app.exec();
}
