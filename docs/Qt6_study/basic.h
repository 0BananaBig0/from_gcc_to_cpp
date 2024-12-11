/*************************************************************************
  > File Name: basic.h
  > Author: Huaxiao Liang
  > Mail: 1184903633@qq.com
  > Created Time: Mon 09 Dec 2024 04:15:06 PM CST
 ************************************************************************/
#ifndef EXAMPLE_H
#define EXAMPLE_H

#include <QWidget>
#include <QPushButton>
#include <QLabel>
#include <QEvent>

class CustomEvent: public QEvent {
   public:
      static const QEvent::Type EventType;

      CustomEvent(): QEvent( EventType ) {}
};

class Example: public QWidget {
      Q_OBJECT

   public:
      Example( QWidget* parent = nullptr );

   protected:
      void customEvent( QEvent* event ) override;

   private slots:
      void onButtonClicked();

   private:
      QPushButton* button;
      QLabel* label;
};

#endif   // EXAMPLE_H
