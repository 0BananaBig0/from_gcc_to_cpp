#define PRO_OBS
#ifdef BEH_OBS
// clang-format off
#include "ObserveEventsAndSignals.h"
#include <QApplication>
// clang-format on
// First, on the top left corner of the window
// press mouse button, release mouse button
// press a normal key, release a normal key
// scroll the mouse wheel, leave the top left conrner
// Second, on the bottom right corner of the window
// Repeate the first five steps, leave the bottom right corner
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

#ifdef PRO_OBS
// clang-format off
#include <QObjectBindableProperty>
#include <QProperty>
#include <QDebug>
#include "Pro.h"
// clang-format on

int main_PRO_OBS();

int main() { return main_PRO_OBS(); }
#endif

#ifdef MAI_WIN
// clang-format off
#include "MainWindow.h"
#include <QStringList>
// clang-format on

int main( int argc, char* argv[] ) {
   QApplication app( argc, argv );
   app.setAttribute( Qt::AA_DontShowIconsInMenus, false );
   MainWindow window;
   window.setWindowTitle( "Main Window" );
   window.showMaximized();
   return app.exec();
}
#endif

