////////////////////////////////////////////////////////////////////////////////
///                       File Name: SelectionSort.cpp                       ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: 1184903633@qq.com                          ///
///                         02/07/2025-Fri-10:41:12                          ///
////////////////////////////////////////////////////////////////////////////////

#include "SelectionSort.hpp"

void SelectionSort::operate() {
   for( size_t i = 0; i < _vec.size(); i++ ) {
      size_t res_id = i;
      for( size_t j = i; j < _vec.size(); j++ ) {
         if( _vec[j] < _vec[res_id] ) {
            res_id = j;
         };
      };
      if( res_id != i ) {
         auto tmp = _vec[i];
         _vec[i] = _vec[res_id];
         _vec[res_id] = tmp;
      };
   };
   return;
};

