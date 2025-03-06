////////////////////////////////////////////////////////////////////////////////
///                            File Name: Pro.cpp                            ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang633@163.com                         ///
///                         12/07/2024-Sat-09:41:51                          ///
////////////////////////////////////////////////////////////////////////////////

#include <QObjectBindableProperty>
#include <QProperty>
#include <QDebug>
#include "Pro.h"

int main_PRO_OBS() {
   ProTest pro_test;
   int count = 0;
   QProperty< int > modern_pro_outside( 7 );
   auto show_name = [&]() {
      qDebug() << "count: " << count << ", tradPro: " << pro_test.tradPro()
               << ", tMBoundPro: " << pro_test.tMBoundPro()
               << ", modernPro: " << pro_test.bindModernPro().value();
   };
   QObject::connect( &pro_test, &ProTest::tradProChanged, show_name );
   QObject::connect( &pro_test, &ProTest::tMBoundProChanged, show_name );
   QObject::connect( &pro_test, &ProTest::tmBindWithTMComProChanged, [&]() {
      qDebug() << "count: " << count
               << ", tMBoundComPro: " << pro_test.tMBoundComPro()
               << ", tmBindWithTMComPro: "
               << pro_test.bindTMBindWithTMComPro().value();
   } );
   QObject::connect( &pro_test, &ProTest::modernProObjChanged, [&]() {
      qDebug() << "count: " << count
               << ", tMBoundComPro: " << pro_test.tMBoundComPro()
               << ", tmBindWithTMComPro: "
               << pro_test.bindTMBindWithTMComPro().value();
   } );

   count++;
   pro_test.setProperty( "tradPro", 1 );
   count++;
   pro_test.setTradPro( 2 );

   // Binding with the internal QProperty object.
   count++;
   pro_test.setModernPro( 3 );
   count++;
   pro_test.setProperty( "tMBoundPro", 12 );
   count++;
   pro_test.setTMBoundPro( 15 );

   // The above two operations unbind `_modernPro`, the binding operation is
   // required again if need.
   count++;
   pro_test.setModernPro( 6 );
   pro_test.bindTMBoundPro().setBinding(
      [&]() { return pro_test.bindModernPro().value() * 3; } );

   // Binding with the external QProperty object.
   count++;
   pro_test.bindTMBoundPro().setBinding(
      [&]() { return modern_pro_outside.value() * 6; } );
   count++;
   modern_pro_outside = 8;
   count++;
   pro_test.setProperty( "tMBoundPro", 54 );
   count++;
   pro_test.setTMBoundPro( 60 );

   // Internal QProperty object binds with external QProperty object.
   count++;
   modern_pro_outside = 11;
   pro_test.bindModernPro().setBinding(
      [&]() { return modern_pro_outside.value() * 7; } );
   show_name();
   return 0;
}

