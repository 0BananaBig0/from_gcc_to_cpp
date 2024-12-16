/*************************************************************************
  > File Name: basic.cpp
  > Author: Huaxiao Liang
  > Mail: 1184903633@qq.com
  > Created Time: Sat 07 Dec 2024 09:41:51 PM CST
 ************************************************************************/
#include "Basic.h"
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
   } else if( event->type() == QEvent::KeyPress ) {
      qDebug() << "ParentEventFilter intercepted a key press event!";
      return true;
   } else if( event->type() == QEvent::MouseButtonDblClick ) {
      qDebug() << "ParentEventFilter intercepted a mouse double click event!";
      return true;
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
   } else if( event->type() == QEvent::KeyPress ) {
      qDebug() << "ChildEventFilter intercepted a key press event!";
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
   layout->addWidget( button, 1, 1);
   layout->addWidget( label, 1, 2 );
   setLayout( layout );
   // Connect signal to slot
   connect(
      button, &QPushButton::clicked, this, &ParentWidget::onButtonClicked );
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
      qDebug() << "ParentWidget handling mouse press event!";
      // Handle the event
      return true;
   } else if( event->type() == QEvent::KeyPress ) {
      qDebug() << "ParentWidget handling key event!";
      // Handle the event
      return true;
   } else if( event->type() == QEvent::MouseButtonRelease ) {
      qDebug() << "ParentWidget handling mouse release event!";
      // Handle the event
      return true;
   }
   // Default handling
   return QWidget::event( event );
}

// Example class implementation
ChildWidget::ChildWidget( QWidget* parent ): QWidget( parent ) {
   // Set up UI components
   button = new QPushButton( "Child Button", this );
   label = new QLabel( "Child Status: Waiting...", this );
   // Layout
   QGridLayout* layout = new QGridLayout( this );
   button->setBaseSize( 10, 20 );
   layout->addWidget( button, 2, 1);
   layout->addWidget( label, 2, 2 );
   setLayout( layout );
   // Connect signal to slot
   connect(
      button, &QPushButton::clicked, this, &ChildWidget::onButtonClicked );
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
      qDebug() << "ChildWidget handling mouse press event!";
      // Handle the event
      return true;
   } else if( event->type() == QEvent::KeyPress ) {
      qDebug() << "ChildWidget handling key event!";
      // Handle the event
      return true;
   } else if( event->type() == QEvent::MouseButtonRelease ) {
      qDebug() << "ChildWidget handling mouse release event!";
      // Handle the event
      return true;
   }
   // Default handling
   return QWidget::event( event );
}
