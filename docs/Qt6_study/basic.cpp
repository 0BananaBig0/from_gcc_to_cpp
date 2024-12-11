/*************************************************************************
  > File Name: basic.cpp
  > Author: Huaxiao Liang
  > Mail: 1184903633@qq.com
  > Created Time: Sat 07 Dec 2024 09:41:51 PM CST
 ************************************************************************/
#include "basic.h"
#include <QVBoxLayout>
#include <QCoreApplication>

// Define the CustomEvent type
const QEvent::Type CustomEvent::EventType
   = static_cast< QEvent::Type >( QEvent::User + 1 );

// Example class implementation
Example::Example( QWidget* parent ): QWidget( parent ) {
   // Set up UI components
   button = new QPushButton( "Click Me", this );
   label = new QLabel( "Status: Waiting...", this );

   // Layout
   QVBoxLayout* layout = new QVBoxLayout( this );
   layout->addWidget( button );
   layout->addWidget( label );
   setLayout( layout );

   // Connect signal to slot
   connect( button, &QPushButton::clicked, this, &Example::onButtonClicked );
}

void Example::onButtonClicked() {
   label->setText( "Button clicked!" );

   // Post a custom event to the event queue
   QCoreApplication::postEvent( this, new CustomEvent() );
}

void Example::customEvent( QEvent* event ) {
   if( event->type() == CustomEvent::EventType ) {
      label->setText( "Custom event handled!" );
   }
}
