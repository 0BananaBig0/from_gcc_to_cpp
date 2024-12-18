#define BEH_OBS
#ifdef BEH_OBS
// clang-format off
#include "Basic.h"
#include <QApplication>
// clang-format on
// First, on the top left corner of the window
// press mouse button, release mouse button
// press a normal key, release a normal key
// scroll the mouse wheel, doublic press mouse button
// Second, on the bottom right corner of the window
// Repeate the six operations
// Observer the output on the terminal
int main( int argc, char* argv[] ) {
   QApplication app( argc, argv );
   ParentEventFilter pfilter;
   ParentWidget pwindow;
   pwindow.installEventFilter( &pfilter );
   ChildEventFilter cfilter;
   // Without or with the parent.
   // ChildWidget cwindow;
   ChildWidget cwindow( &pwindow );
   cwindow.installEventFilter( &cfilter );
   pwindow.resize( 1200, 600 );
   cwindow.resize( 600, 1200 );
   pwindow.show();
   cwindow.show();
   return app.exec();
}
#endif

#ifdef SIM_MEN
// clang-format off
#include "SimpleMenu.h"
// clang-format on

int main( int argc, char* argv[] ) {
   QApplication app( argc, argv );
   SimpleMenu window;
   window.resize( 350, 250 );
   window.setWindowTitle( "Simple menu" );
   window.show();
   return app.exec();
}
#endif

#ifdef ANO_MEN
// clang-format off
#include "AnotherMenu.h"
#include <QStringList>
// clang-format on

int main( int argc, char* argv[] ) {
   QApplication app( argc, argv );
   app.setAttribute( Qt::AA_DontShowIconsInMenus, false );
   // QIcon::setThemeSearchPaths( QStringList("/usr/share/icons/Adwaita") );
   // QApplication::setStyle("Fusion");  // or "Adwaita" for GTK style
   AnotherMenu window;
   window.resize( 350, 250 );
   window.setWindowTitle( "Another menu" );
   window.show();
   return app.exec();
}
#endif
