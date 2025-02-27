////////////////////////////////////////////////////////////////////////////////
///                   File Name: ObserveEventsAndSignals.h                   ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: hxliang633@163.com                         ///
///                         12/09/2024-Mon-16:15:06                          ///
////////////////////////////////////////////////////////////////////////////////

#pragma once
#include <QWidget>
#include <QPushButton>
#include <QLabel>
#include <QEvent>
#include <QWheelEvent>
#include <QKeyEvent>
#include <QMouseEvent>

class CustomEvent: public QEvent {
   public:
      static const QEvent::Type EventType;

      CustomEvent(): QEvent( EventType ) {}
};

class ParentEventFilter: public QObject {
      Q_OBJECT

   public:
      ParentEventFilter( QObject* parent = nullptr );

   protected:
      bool eventFilter( QObject* watched, QEvent* event ) override;
};

class ChildEventFilter: public QObject {
      Q_OBJECT

   public:
      ChildEventFilter( QObject* parent = nullptr );

   protected:
      bool eventFilter( QObject* watched, QEvent* event ) override;
};

class ParentWidget: public QWidget {
      Q_OBJECT
      Q_PROPERTY( int myProperty READ myProperty )

   public:
      ParentWidget( QWidget* parent = nullptr );

      int& myProperty() { return m_value; };

   protected:
      void customEvent( QEvent* event ) override;
      bool event( QEvent* event ) override;
      void mousePressEvent( QMouseEvent* event ) override;
      void mouseReleaseEvent( QMouseEvent* event ) override;
      void keyPressEvent( QKeyEvent* event ) override;
      void keyReleaseEvent( QKeyEvent* event ) override;
      void wheelEvent( QWheelEvent* event ) override;
      void leaveEvent( QEvent* event ) override;
   private Q_SLOTS:
      void onButtonClicked();

   private:
      QPushButton* button;
      QLabel* label;
      int m_value = 1;
};

class ChildWidget: public QWidget {
      Q_OBJECT

   public:
      ChildWidget( QWidget* parent = nullptr );

   protected:
      void customEvent( QEvent* event ) override;
      bool event( QEvent* event ) override;
      void mousePressEvent( QMouseEvent* event ) override;
      void mouseReleaseEvent( QMouseEvent* event ) override;
      void keyPressEvent( QKeyEvent* event ) override;
      void keyReleaseEvent( QKeyEvent* event ) override;
      void wheelEvent( QWheelEvent* event ) override;
   private Q_SLOTS:
      void onButtonClicked();

   private:
      QPushButton* button;
      QLabel* label;
};

