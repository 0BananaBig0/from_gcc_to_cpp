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
   ProTest pro_exa;
   int count = 0;
   QProperty< int > bindable_pro( 7 );
   auto show_name = [&]() {
      qDebug() << "count: " << count << ", tradPro: " << pro_exa.tradPro()
               << ", tMBoundPro: " << pro_exa.tMBoundPro()
               << ", bindablePro: " << pro_exa.bindBindablePro().value();
   };
   QObject::connect( &pro_exa, &ProTest::tradProChanged, show_name );
   QObject::connect( &pro_exa, &ProTest::tMBoundProChanged, show_name );
   QObject::connect( &pro_exa, &ProTest::tmBindWithTMComProChanged, [&]() {
      qDebug() << "count: " << count
               << ", tMBoundComPro: " << pro_exa.tMBoundComPro()
               << ", tmBindWithTMComPro: "
               << pro_exa.bindTMBindWithTMComPro().value();
   } );

   count++;
   pro_exa.setProperty( "tradPro", 1 );
   count++;
   pro_exa.setTradPro( 2 );

   // Binding with the internal QProperty object.
   // pro_exa.boundObj().setBinding(
   //    [&]() { return pro_exa.getbindablePropObj().value() * 3; } );
   count++;
   pro_exa.setBindablePro( 3 );
   count++;
   pro_exa.setProperty( "tMBoundPro", 12 );
   count++;
   pro_exa.setTMBoundPro( 15 );

   // The above two operations unbind `_bindablePro`, the binding operation is
   // required again if need.
   count++;
   pro_exa.setBindablePro( 6 );
   pro_exa.bindTMBoundPro().setBinding(
      [&]() { return pro_exa.bindBindablePro().value() * 3; } );

   // Binding with the external QProperty object.
   count++;
   pro_exa.bindTMBoundPro().setBinding(
      [&]() { return bindable_pro.value() * 6; } );
   count++;
   bindable_pro = 8;
   count++;
   pro_exa.setProperty( "tMBoundPro", 54 );
   count++;
   pro_exa.setTMBoundPro( 60 );

   // Internal QProperty object binds with external QProperty object.
   count++;
   bindable_pro = 11;
   pro_exa.bindBindablePro().setBinding(
      [&]() { return bindable_pro.value() * 7; } );
   show_name();
   return 0;
}

