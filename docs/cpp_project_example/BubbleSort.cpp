////////////////////////////////////////////////////////////////////////////////
///                        File Name: BubbleSort.cpp                         ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: 1184903633@qq.com                          ///
///                         02/07/2025-Fri-10:42:09                          ///
////////////////////////////////////////////////////////////////////////////////

#include "BubbleSort.hpp"

void BubbleSort::operate() {
   // Determine whether all elements have been sorted.
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

