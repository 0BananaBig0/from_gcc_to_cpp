#include "Basic.h"
#include <QApplication>

int main( int argc, char* argv[] ) {
   QApplication app( argc, argv );

   Example window;
   window.resize( 300, 200 );
   window.show();

   return app.exec();
}
