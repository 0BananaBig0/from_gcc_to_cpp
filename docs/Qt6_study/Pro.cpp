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

   // The above two operations unbind `_bindablePro`, the binding operation is
   // required again if need.
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
   return 0;
}
