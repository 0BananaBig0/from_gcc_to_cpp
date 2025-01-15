///////////////////////////////////////////////////////////////////////////
//  > File Name: SelectionSort.hpp
//  > Author: Huaxiao Liang
//  > Mail: 1184903633@qq.com
//  > Created Time: 01/15/2025-Wed-19:11:07
///////////////////////////////////////////////////////////////////////////

#pragma once
#include "Sort.hpp"

class SelectionSort final: public Sort {
   public:
      void operate() override;

      SelectionSort(): Sort{} { OUTMES( "Derived default constructor." ); };

      SelectionSort( const SelectionSort& other ): Sort{ other } {
         OUTMES( "Derived copy constructor." );
      };   // Not require move semenetatic.

      SelectionSort( SelectionSort&& other ): Sort{ std::move( other ) } {
         OUTMES( "Derived move constructor." );
      };   // Require move semenetatic.

      explicit SelectionSort( const std::vector< int >& vec ): Sort{ vec } {
         OUTMES( "Derived parameterized constructor with copy." );
      };

      explicit SelectionSort( std::vector< int >&& vec ):
         Sort{ std::move( vec ) } {
         OUTMES( "Derived parameterized constructor with move semenetatic." );
      };

   private:
};

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
