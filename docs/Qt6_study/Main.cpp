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

int main() {
   ProExa pro_exa;
   int count = 0;
   QProperty< int > bindable_pro( 7 );
   QObject::connect( &pro_exa, &ProExa::norProChanged, [&]() {
      count++;
      qDebug() << "norPro: " << pro_exa.norPro()
               << ", boundPro: " << pro_exa.boundPro()
               << ", bindableProObj: " << pro_exa.bindBindablePro().value()
               << ", boundComPro: " << pro_exa.boundComPro()
               << ", count: " << count;
   } );
   QObject::connect( &pro_exa, &ProExa::boundProChanged, [&]() {
      count++;
      qDebug() << "norPro: " << pro_exa.norPro()
               << ", boundPro: " << pro_exa.boundPro()
               << ", bindableProObj: " << pro_exa.bindBindablePro().value()
               << ", boundComPro: " << pro_exa.boundComPro()
               << ", count: " << count;
   } );

   pro_exa.setProperty( "norPro", 1 );
   pro_exa.setNorPro( 2 );

   // Binding with the internal QProperty object.
   // pro_exa.boundObj().setBinding(
   //    [&]() { return pro_exa.getbindablePropObj().value() * 3; } );
   pro_exa.setBindablePro( 3 );
   pro_exa.setProperty( "boundPro", 12 );
   pro_exa.setBoundPro( 15 );

   // The above two operations unbind `_prop`, the binding operation is required
   // again if need.
   pro_exa.setBindablePro( 6 );
   pro_exa.bindBoundPro().setBinding(
      [&]() { return pro_exa.bindBindablePro().value() * 3; } );

   // Binding with the external QProperty object.
   pro_exa.bindBoundPro().setBinding(
      [&]() { return bindable_pro.value() * 6; } );
   bindable_pro = 8;
   pro_exa.setProperty( "boundPro", 54 );
   pro_exa.setBoundPro( 60 );

   // Internal QProperty object binds with external QProperty object.
   pro_exa.bindBindablePro().setBinding(
      [&]() { return bindable_pro.value() * 7; } );
   bindable_pro = 11;
   count++;
   qDebug() << "bindableProObj: " << pro_exa.bindBindablePro().value()
            << ", count: " << count;
}
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
