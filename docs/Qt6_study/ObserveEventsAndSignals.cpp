/*************************************************************************
  > File Name: ObserveEventsAndSignals.cpp
  > Author: Huaxiao Liang
  > Mail: 1184903633@qq.com
  > Created Time: Sat 07 Dec 2024 09:41:51 PM CST
 ************************************************************************/
#include "ObserveEventsAndSignals.h"
#include <QVBoxLayout>
#include <QCoreApplication>
// In this example, you can modify the accepted events' types to observe how an
// event is passed and processed when it occurs. Define the CustomEvent type
const QEvent::Type CustomEvent::EventType
   = static_cast< QEvent::Type >( QEvent::User + 1 );

ParentEventFilter::ParentEventFilter( QObject* parent ): QObject( parent ) {};

bool ParentEventFilter::eventFilter( QObject* watched, QEvent* event ) {
   if( event->type() == QEvent::MouseButtonPress ) {
      qDebug() << "ParentEventFilter intercepted a mouse press event!";
      // Consume the event
      return true;
   } else if( event->type() == QEvent::MouseButtonRelease ) {
      qDebug() << "ParentEventFilter intercepted a mouse release event!";
      return true;
   } else if( event->type() == QEvent::KeyPress ) {
      qDebug() << "ParentEventFilter intercepted a key press event!";
      return true;
      // } else if( event->type() == QEvent::KeyRelease ) {
      //    qDebug() << "ParentEventFilter intercepted a key release event!";
      //    return true;
   }
   // Pass event to the next filter or object
   return QObject::eventFilter( watched, event );
}

ChildEventFilter::ChildEventFilter( QObject* parent ): QObject( parent ) {};

bool ChildEventFilter::eventFilter( QObject* watched, QEvent* event ) {
   if( event->type() == QEvent::MouseButtonPress ) {
      qDebug() << "ChildEventFilter intercepted a mouse press event!";
      // Consume the event
      return true;
   }
   // Pass event to the next filter or object
   return QObject::eventFilter( watched, event );
}

// Example class implementation
ParentWidget::ParentWidget( QWidget* parent ): QWidget( parent ) {
   // Set up UI components
   button = new QPushButton( "Parent Button", this );
   label = new QLabel( "Parent Status: Waiting...", this );
   // Layout
   QGridLayout* layout = new QGridLayout( this );
   button->setBaseSize( 10, 20 );
   layout->addWidget( button, 1, 1 );
   layout->addWidget( label, 1, 2 );
   setLayout( layout );
   // Connect signal to slot
   connect( button,
            &QPushButton::clicked,
            this,
            &ParentWidget::onButtonClicked );
}

void ParentWidget::onButtonClicked() {
   label->setText( "Button clicked! Parent!" );
   // Post a custom event to the event queue
   QCoreApplication::postEvent( this, new CustomEvent() );
}

void ParentWidget::customEvent( QEvent* event ) {
   if( event->type() == CustomEvent::EventType ) {
      label->setText( "Custom event handled! Parent!" );
   }
}

bool ParentWidget::event( QEvent* event ) {
   if( event->type() == QEvent::MouseButtonPress ) {
      qDebug() << "ParentWidget handled a mouse press event!";
      // Handle the event
      return true;
   } else if( event->type() == QEvent::MouseButtonRelease ) {
      qDebug() << "ParentWidget handled a mouse release event!";
      // Handle the event
      return true;
   } else if( event->type() == QEvent::KeyPress ) {
      qDebug() << "ParentWidget handled a key press event!";
      return true;
   } else if( event->type() == QEvent::KeyRelease ) {
      qDebug() << "ParentWidget handled a key release event!";
      return true;
      // } else if( event->type() == QEvent::Wheel ) {
      //    qDebug() << "ParentWidget handled a mouse wheel event!";
      //    // Handle the event
      //    return true;
   }
   // Default handling
   return QWidget::event( event );
}

void ParentWidget::mousePressEvent( QMouseEvent* event ) {
   qDebug() << "ParentWidget handled a mousePressEvent!";
   QWidget::mousePressEvent( event );
}

void ParentWidget::mouseReleaseEvent( QMouseEvent* event ) {
   qDebug() << "ParentWidget handled a mouseReleaseEvent!";
   QWidget::mouseReleaseEvent( event );
}

void ParentWidget::keyPressEvent( QKeyEvent* event ) {
   qDebug() << "ParentWidget handled a keyPressEvent!";
   QWidget::keyPressEvent( event );
}

void ParentWidget::keyReleaseEvent( QKeyEvent* event ) {
   qDebug() << "ParentWidget handled a keyReleaseEvent!";
   QWidget::keyReleaseEvent( event );
}

void ParentWidget::wheelEvent( QWheelEvent* event ) {
   qDebug() << "ParentWidget handled a wheelEvent!";
   QWidget::wheelEvent( event );
}

void ParentWidget::leaveEvent( QEvent* event ) {
   qDebug() << "ParentWidget handled a leaveEvent!";
   QWidget::leaveEvent( event );
}

// Example class implementation
ChildWidget::ChildWidget( QWidget* parent ): QWidget( parent ) {
   // Set up UI components
   button = new QPushButton( "Child Button", this );
   label = new QLabel( "Child Status: Waiting...", this );
   // Layout
   QGridLayout* layout = new QGridLayout( this );
   button->setBaseSize( 10, 20 );
   layout->addWidget( button, 2, 1 );
   layout->addWidget( label, 2, 2 );
   setLayout( layout );
   // Connect signal to slot
   connect( button,
            &QPushButton::clicked,
            this,
            &ChildWidget::onButtonClicked );
}

void ChildWidget::onButtonClicked() {
   label->setText( "Button clicked! Child" );
   // Post a custom event to the event queue
   QCoreApplication::postEvent( this, new CustomEvent() );
}

void ChildWidget::customEvent( QEvent* event ) {
   if( event->type() == CustomEvent::EventType ) {
      label->setText( "Custom event handled! Child!" );
   }
}

bool ChildWidget::event( QEvent* event ) {
   if( event->type() == QEvent::MouseButtonPress ) {
      qDebug() << "ChildWidget handled a mouse press event!";
      // Handle the event
      return true;
   } else if( event->type() == QEvent::MouseButtonRelease ) {
      qDebug() << "ChildWidget handled a mouse release event!";
      return true;
   }
   // Default handling
   return QWidget::event( event );
}

void ChildWidget::mousePressEvent( QMouseEvent* event ) {
   qDebug() << "ChildWidget handled a mousePressEvent!";
   QWidget::mousePressEvent( event );
}

void ChildWidget::mouseReleaseEvent( QMouseEvent* event ) {
   qDebug() << "ChildWidget handled a mouseReleaseEvent!";
   QWidget::mouseReleaseEvent( event );
}

void ChildWidget::keyPressEvent( QKeyEvent* event ) {
   qDebug() << "ChildWidget handled a keyPressEvent!";
   QWidget::keyPressEvent( event );
}

void ChildWidget::keyReleaseEvent( QKeyEvent* event ) {
   qDebug() << "ChildWidget handled a keyReleaseEvent!";
   QWidget::keyReleaseEvent( event );
}

void ChildWidget::wheelEvent( QWheelEvent* event ) {
   qDebug() << "ChildWidget handled a wheelEvent!";
   QWidget::wheelEvent( event );
}
