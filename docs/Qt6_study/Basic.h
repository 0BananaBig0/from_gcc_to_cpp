/*************************************************************************
  > File Name: basic.h
  > Author: Huaxiao Liang
  > Mail: 1184903633@qq.com
  > Created Time: Mon 09 Dec 2024 04:15:06 PM CST
 ************************************************************************/
#ifndef BASIC_H
#define BASIC_H
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

   public:
      ParentWidget( QWidget* parent = nullptr );

   protected:
      void customEvent( QEvent* event ) override;
      bool event( QEvent* event ) override;
      void mousePressEvent( QMouseEvent* event ) override;
      void mouseReleaseEvent(QMouseEvent *event) override;
      void keyPressEvent( QKeyEvent* event ) override;
      void keyReleaseEvent( QKeyEvent* event ) override;
      void wheelEvent( QWheelEvent* event ) override;
      void mouseDoubleClickEvent( QMouseEvent* event ) override;
   private Q_SLOTS:
      void onButtonClicked();

   private:
      QPushButton* button;
      QLabel* label;
};

class ChildWidget: public QWidget {
      Q_OBJECT

   public:
      ChildWidget( QWidget* parent = nullptr );

   protected:
      void customEvent( QEvent* event ) override;
      bool event( QEvent* event ) override;
      void mousePressEvent( QMouseEvent* event ) override;
      void mouseReleaseEvent(QMouseEvent *event) override;
      void keyPressEvent( QKeyEvent* event ) override;
      void keyReleaseEvent( QKeyEvent* event ) override;
      void wheelEvent( QWheelEvent* event ) override;
   private Q_SLOTS:
      void onButtonClicked();

   private:
      QPushButton* button;
      QLabel* label;
};
#endif   // EXAMPLE_H
