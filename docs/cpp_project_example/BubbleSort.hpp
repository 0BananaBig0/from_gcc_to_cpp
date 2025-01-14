///////////////////////////////////////////////////////////////////////////
//  > File Name: BubbleSort.hpp
//  > Author: Huaxiao Liang
//  > Mail: 1184903633@qq.com
//  > Created Time: 01/14/2025-Tue-10:50:15
///////////////////////////////////////////////////////////////////////////

#pragma once
#include "Sort.hpp"
#include "CircularQueue.hpp"

class BubbleSort final: public Sort {
   public:
      void operate() override;

      BubbleSort(): Sort{} { OUTMES( "Derived default constructor." ); };

      BubbleSort( const BubbleSort& other ): Sort{ other } {
         OUTMES( "Derived copy constructor." );
      };   // Not require move semenetatic.

      BubbleSort( BubbleSort&& other ): Sort{ std::move( other ) } {
         OUTMES( "Derived move constructor." );
      };   // Require move semenetatic.

      explicit BubbleSort( const std::vector< int >& vec ): Sort{ vec } {
         OUTMES( "Derived parameterized constructor with copy." );
      };

      explicit BubbleSort( std::vector< int >&& vec ):
         Sort{ std::move( vec ) } {
         OUTMES( "Derived parameterized constructor with move semenetatic." );
      };

   private:
};

void BubbleSort::operate() {
   bool flag = false;
   do {
      flag = false;
      for( size_t i = 0; i < _vec.size() - 1; i++ ) {
         if( _vec[i] > _vec[i + 1] ) {
            auto tmp = _vec[i];
            _vec[i] = _vec[i + 1];
            _vec[i + 1] = tmp;
            flag = true;
         };
      };
   } while( flag );
};
