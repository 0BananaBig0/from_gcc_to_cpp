/*************************************************************************
  >
 * File Name: Pro.h
  > Author: Huaxiao Liang
  > Mail: 1184903633@qq.com
  >
 * Created Time: Mon 09 Dec 2024 04:15:06 PM CST
 * ************************************************************************/
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
// The `Q_PROPERTY()` macro registers a class
// member variable as a property with a specified `name`, allowing the member to
// be read and modified using `QObject::property()` and
// `QObject::setProperty()`, which take the property name as a string. It does
// not directly create the associated class member but binds the class member to
// the property name, treating it as a property with that name.

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
class ProExa: public QObject {
      Q_OBJECT
      Q_PROPERTY( int norPro READ norPro WRITE setNorPro NOTIFY norProChanged )
      Q_PROPERTY(
         int boundPro READ boundPro WRITE setBoundPro BINDABLE bindBoundPro )
      Q_PROPERTY( int boundComPro READ boundComPro NOTIFY boundComProChanged
                     STORED false BINDABLE bindBoundComPro )
      Q_PROPERTY( int bindWithComPro READ bindWithComPro WRITE setBindWithComPro
                     BINDABLE bindBindWithComPro )

   public:
      explicit ProExa( QObject* parent = nullptr ):
         QObject( parent ),
         _norPro( 0 ),
         _bindablePro( 0 ),
         _boundPro( 0 ) {
         // Binding with the internal QProperty object.
         _boundPro.setBinding( [&]() { return _bindablePro.value() * 3; } );
         _bindWithComPro.setBinding(
            [&]() { return _boundComPro.value() * 2; } );
      }

      int norPro() const { return _norPro; }

      void setNorPro( int val ) {
         if( _norPro == val ) {
            return;
         }
         _norPro = val;
         // Should emit the signal manually and explicitly, if not register the
         // signal.
         emit norProChanged( val );
         // A change in a value which is not a BINDABLE property requires
         // calling notify. Otherwise, all properties depending on
         // Q_OBJECT_COMPUTED_PROPERTY are not updated.
         _boundComPro.notify();
      }

      // Can't have any `const` qualifier, when this function is used to bind
      // with other QProperty objects.
      QProperty< int >& bindBindablePro() { return _bindablePro; }

      void setBindablePro( int val ) {
         if( _bindablePro == val ) {
            return;
         }
         _bindablePro = val;
         emit bindableProObjChanged( val );
         // A BINDABLE property used in the callback changes,
         // the notificiation occurs automatically.
         // _boundComPro.notify();
      }

      int boundPro() const { return _boundPro.value(); }

      // It is not recommended to use a setter to assign a value to a bindable
      // property.
      void setBoundPro( int val ) {
         if( _boundPro == val ) {
            return;
         }
         _boundPro = val;
         // It's used to verify whether binding ignores the setter.
         if( _boundPro == 9 || _boundPro == 18 || _boundPro == 48 ) {
            qDebug() << "Binding calls the setter to set a value directly? "
                        "boundPro: "
                     << _boundPro;
         }
         // It's used to verify whether setProperty calls the setter.
         if( _boundPro == 12 || _boundPro == 54 ) {
            qDebug() << "setProperty calls the setter to set a value directly? "
                        "boundPro: "
                     << _boundPro;
         }
         // Q_OBJECT_BINDABLE_PROPERTY has registered this signal,
         // we shouldn't emit it manually and explicitly again.
         // emit boundProChanged( val );

         // A BINDABLE property used in the callback changes,
         // the notificiation occurs automatically.
         // _boundComPro.notify();
      }

      // Can't have any `const` qualifier, when this function is used to bind
      // with other QProperty objects.
      // Construct a Qbindable object so that the property is allowed to be
      // bound like QProperty objects.
      QBindable< int > bindBoundPro() { return &_boundPro; }

      int boundComPro() const { return _boundComPro.value(); }

      // Can't have any `const` qualifier, when this function is used to bind
      // with other QProperty objects.
      QBindable< int > bindBoundComPro() { return &_boundComPro; }

      int bindWithComPro() const { return _bindWithComPro.value(); }

      // It is not recommended to use a setter to assign a value to a bindable
      // property.
      void setBindWithComPro( int val ) {
         if( _bindWithComPro == val ) {
            return;
         }
         _bindWithComPro = val;
      }

      // Can't have any `const` qualifier, when this function is used to bind
      // with other QProperty objects.
      // Construct a Qbindable object so that the property is allowed to be
      // bound like QProperty objects.
      QBindable< int > bindBindWithComPro() { return &_bindWithComPro; }

   signals:
      void norProChanged( int );
      void bindableProObjChanged( int );
      void boundProChanged( int value );
      void boundComProChanged();
      void bindWithComProChanged( int value );

   private:
      // Q_OBJECT_COMPUTED_PROPERTY requires this function to be private
      // and to be only called by Q_OBJECT_COMPUTED_PROPERTY.
      // This function must be a `const` method.
      int sumTheFirstThreePros() const {
         return _norPro + _boundPro.value() + _bindablePro.value();
      }

      int _norPro;
      // It's also a BINDABLE property, but can be outside of QObject classes.
      QProperty< int > _bindablePro;
      // The following two BINDABLE property must be inside of QObject classes.
      // Also, these two BINDABLE property register their changed signals.
      Q_OBJECT_BINDABLE_PROPERTY( ProExa,
                                  int,
                                  _boundPro,
                                  &ProExa::boundProChanged );
      Q_OBJECT_COMPUTED_PROPERTY( ProExa,
                                  int,
                                  _boundComPro,
                                  &ProExa::sumTheFirstThreePros )
      Q_OBJECT_BINDABLE_PROPERTY( ProExa,
                                  int,
                                  _bindWithComPro,
                                  &ProExa::bindWithComProChanged );
};
