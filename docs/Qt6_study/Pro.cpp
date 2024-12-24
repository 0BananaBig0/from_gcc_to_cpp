/*************************************************************************
  > File Name: Pro.cpp
  > Author: Huaxiao Liang
  > Mail: 1184903633@qq.com
  > Created Time: Sat 07 Dec 2024 09:41:51 PM CST
 ************************************************************************/
#include <QObjectBindableProperty>
#include <QProperty>
#include <QDebug>
#include "Pro.h"

int main_PRO_OBS() {
   ProExa pro_exa;
   int count = 0;
   QProperty< int > bindable_pro( 7 );
   auto show_name = [&]() {
      qDebug() << "count: " << count << ", norPro: " << pro_exa.norPro()
               << ", boundPro: " << pro_exa.boundPro()
               << ", bindablePro: " << pro_exa.bindBindablePro().value();
   };
   QObject::connect( &pro_exa, &ProExa::norProChanged, show_name );
   QObject::connect( &pro_exa, &ProExa::boundProChanged, show_name );
   QObject::connect( &pro_exa, &ProExa::bindWithComProChanged, [&]() {
      qDebug() << "count: " << count
               << ", boundComPro: " << pro_exa.boundComPro()
               << ", bindWithComPro: " << pro_exa.bindBindWithComPro().value();
   } );

   count++;
   pro_exa.setProperty( "norPro", 1 );
   count++;
   pro_exa.setNorPro( 2 );

   // Binding with the internal QProperty object.
   // pro_exa.boundObj().setBinding(
   //    [&]() { return pro_exa.getbindablePropObj().value() * 3; } );
   count++;
   pro_exa.setBindablePro( 3 );
   count++;
   pro_exa.setProperty( "boundPro", 12 );
   count++;
   pro_exa.setBoundPro( 15 );

   // The above two operations unbind `_bindablePro`, the binding operation is
   // required again if need.
   count++;
   pro_exa.setBindablePro( 6 );
   pro_exa.bindBoundPro().setBinding(
      [&]() { return pro_exa.bindBindablePro().value() * 3; } );

   // Binding with the external QProperty object.
   count++;
   pro_exa.bindBoundPro().setBinding(
      [&]() { return bindable_pro.value() * 6; } );
   count++;
   bindable_pro = 8;
   count++;
   pro_exa.setProperty( "boundPro", 54 );
   count++;
   pro_exa.setBoundPro( 60 );

   // Internal QProperty object binds with external QProperty object.
   count++;
   bindable_pro = 11;
   pro_exa.bindBindablePro().setBinding(
      [&]() { return bindable_pro.value() * 7; } );
   show_name();
   return 0;
}
