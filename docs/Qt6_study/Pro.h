////////////////////////////////////////////////////////////////////////////////
///                             File Name: Pro.h                             ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang633@163.com                         ///
///                         12/09/2024-Mon-16:15:06                          ///
////////////////////////////////////////////////////////////////////////////////

#pragma once
#include <QtCore>
#include <QDebug>
#include <QObject>
#include <QProperty>
#include <QObjectBindableProperty>
#include <QObjectComputedProperty>
#include <QQuickView>

// All properties should not be used as a temporary variable.
// All getters should be and must be a `const` method.
// All BINDABLE can't be a `const` method.
// All bindable objects, bound properties and bound objects should be in the
// same thread if they bind with each other.

// Traditional property: Q_PROPERTY.
// The `Q_PROPERTY()` macro registers a class member variable as a property with
// a specified `name`, allowing the member to be read and modified using
// `QObject::property()`(read) and `QObject::setProperty()`(mdoify), which take
// the property name as a string. It does not directly create the associated
// class member but binds the class member to the property name, treating it as
// a property with that name.

// When `BINDABLE` is specified, programmers should not emit the `NOTIFY` signal
// manually and explicitly (otherwise, the signal is emitted twice if we update
// values without using bindings.) in the setter. Instead, they need to register
// the `NOTIFY` signal with the `BINDABLE` object, which is created using
// bindable classes or related macros like `Q_OBJECT_BINDABLE_PROPERTY`. Once
// the bindable object is modified, regardless of the method used, the `NOTIFY`
// signal is emitted.

// Normally, `WRITE` generates a default `WRITE` accessor that does not emit any
// signal.

// If `BINDABLE` is not specified, programmers should explicitly emit a signal
// in the `WRITE` accessor. The systematic Qt API (e.g., `QObject::setProperty`,
// `QMetaProperty`, etc.) will call the `WRITE` accessor to perform
// modifications.

// Modern properties: QProperty,
//                    QObjectBindableProperty ( Q_OBJECT_BINDABLE_PROPERTY ),
//                    QObjectComputedProperty ( Q_OBJECT_COMPUTED_PROPERTY ).
// Can only be used inside QObject-derived classes:
//                    QObjectBindableProperty ( Q_OBJECT_BINDABLE_PROPERTY ),
//                    QObjectComputedProperty ( Q_OBJECT_COMPUTED_PROPERTY ).
// No limits: QProperty.
// Store a value: QProperty,
//                QObjectBindableProperty ( Q_OBJECT_BINDABLE_PROPERTY ).
// Not store values: QObjectComputedProperty ( Q_OBJECT_COMPUTED_PROPERTY ).
// Only update values when are read:
//                QObjectComputedProperty ( Q_OBJECT_COMPUTED_PROPERTY ).

// When bindable properties are bound to each other, their values are
// automatically updated whenever one of them changes.

// Modern properties can work with traditional properties when they need the
// meta-object system or exposure to QML.
// When BINDABLE is specified in Q_PROPERTY, it must work with modern properties
// such as Q_OBJECT_BINDABLE_PROPERTY or QProperty.

// pro = property, t/trad = traditional, m = modern, com = computed
class ProTest: public QObject {
      Q_OBJECT
      Q_PROPERTY(
         int tradPro READ tradPro WRITE setTradPro NOTIFY tradProChanged )
      // Work with modern properties for exposing modern properties to QML.
      Q_PROPERTY( int tMBoundPro READ tMBoundPro WRITE setTMBoundPro BINDABLE
                     bindTMBoundPro )
      Q_PROPERTY(
         int tMBoundComPro READ tMBoundComPro NOTIFY tMBoundComProChanged
            STORED false BINDABLE bindTMBoundComPro )
      Q_PROPERTY( int tmBindWithTMComPro READ tmBindWithTMComPro WRITE
                     setTMBindWithTMComPro BINDABLE bindTMBindWithTMComPro )

   public:
      explicit ProTest( QObject* parent = nullptr ):
         QObject( parent ),
         _tradPro( 0 ),
         _modernPro( 0 ),
         _tMBoundPro( 0 ) {
         // Binding with the internal QProperty object.
         _tMBoundPro.setBinding( [&]() { return _modernPro.value() * 3; } );
         _tmBindWithTMComPro.setBinding(
            [&]() { return _tMBoundComPro.value() * 2; } );
      }

      int tradPro() const { return _tradPro; }

      void setTradPro( int val ) {
         if( _tradPro == val ) {
            return;
         }
         _tradPro = val;
         // Should emit the signal manually and explicitly, if its related
         // modern property does not register the signal.
         emit tradProChanged( val );
         // A change in a value which is not a BINDABLE property requires
         // calling notify. Otherwise, all properties depending on
         // Q_OBJECT_COMPUTED_PROPERTY are not updated.
         _tMBoundComPro.notify();
      }

      // Can't have any `const` qualifier, when this function is used to bind
      // with other QProperty objects.
      QProperty< int >& bindBindablePro() { return _modernPro; }

      void setBindablePro( int val ) {
         if( _modernPro == val ) {
            return;
         }
         _modernPro = val;
         // Should emit the signal manually and explicitly, if its related
         // modern property does not register the signal.
         emit modernProObjChanged( val );
         // A BINDABLE property used in the callback changes,
         // the notificiation occurs automatically.
         // _tMBoundComPro.notify();
      }

      int tMBoundPro() const { return _tMBoundPro.value(); }

      // It is not recommended to use a setter to assign a value to a bindable
      // property.
      void setTMBoundPro( int val ) {
         if( _tMBoundPro == val ) {
            return;
         }
         _tMBoundPro = val;
         // It's used to verify whether binding ignores the setter.
         if( _tMBoundPro == 9 || _tMBoundPro == 18 || _tMBoundPro == 48 ) {
            qDebug() << "Binding calls the setter to set a value directly? "
                        "tMBoundPro: "
                     << _tMBoundPro;
         }
         // It's used to verify whether setProperty calls the setter.
         if( _tMBoundPro == 12 || _tMBoundPro == 54 ) {
            qDebug() << "setProperty calls the setter to set a value directly? "
                        "tMBoundPro: "
                     << _tMBoundPro;
         }
         // Q_OBJECT_BINDABLE_PROPERTY has registered this signal,
         // we shouldn't emit it manually and explicitly again.
         // emit tMBoundProChanged( val );

         // A BINDABLE property used in the callback changes,
         // the notificiation occurs automatically.
         // _tMBoundComPro.notify();
      }

      // Can't have any `const` qualifier, when this function is used to bind
      // with other QProperty objects.
      // Construct a Qbindable object so that the property is allowed to be
      // bound like QProperty objects.
      QBindable< int > bindTMBoundPro() { return &_tMBoundPro; }

      int tMBoundComPro() const { return _tMBoundComPro.value(); }

      // Can't have any `const` qualifier, when this function is used to bind
      // with other QProperty objects.
      QBindable< int > bindTMBoundComPro() { return &_tMBoundComPro; }

      int tmBindWithTMComPro() const { return _tmBindWithTMComPro.value(); }

      // It is not recommended to use a setter to assign a value to a bindable
      // property.
      void setTMBindWithTMComPro( int val ) {
         if( _tmBindWithTMComPro == val ) {
            return;
         }
         _tmBindWithTMComPro = val;
      }

      // Can't have any `const` qualifier, when this function is used to bind
      // with other QProperty objects.
      // Construct a Qbindable object so that the property is allowed to be
      // bound like QProperty objects.
      QBindable< int > bindTMBindWithTMComPro() { return &_tmBindWithTMComPro; }

   signals:
      void tradProChanged( int );
      void modernProObjChanged( int );
      void tMBoundProChanged( int value );
      void tMBoundComProChanged();
      void tmBindWithTMComProChanged( int value );

   private:
      // Q_OBJECT_COMPUTED_PROPERTY requires this function to be private
      // and to be only called by Q_OBJECT_COMPUTED_PROPERTY.
      // This function must be a `const` method.
      int sumTheFirstThreePros() const {
         return _tradPro + _tMBoundPro.value() + _modernPro.value();
      }

      int _tradPro;
      // It's also a BINDABLE property, but can be outside of QObject classes.
      QProperty< int > _modernPro;
      // The following two BINDABLE property must be inside of QObject classes.
      // Also, these two BINDABLE property register their changed signals.
      // Work with traditional properties.
      Q_OBJECT_BINDABLE_PROPERTY( ProTest,
                                  int,
                                  _tMBoundPro,
                                  &ProTest::tMBoundProChanged );
      Q_OBJECT_COMPUTED_PROPERTY( ProTest,
                                  int,
                                  _tMBoundComPro,
                                  &ProTest::sumTheFirstThreePros )
      Q_OBJECT_BINDABLE_PROPERTY( ProTest,
                                  int,
                                  _tmBindWithTMComPro,
                                  &ProTest::tmBindWithTMComProChanged );
};

