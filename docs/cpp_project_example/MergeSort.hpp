///////////////////////////////////////////////////////////////////////////
//  > File Name: MergeSort.hpp
//  > Author: Huaxiao Liang
//  > Mail: 1184903633@qq.com
//  > Created Time: 01/14/2025-Tue-10:50:15
///////////////////////////////////////////////////////////////////////////

#pragma once
#include "Sort.hpp"
#include "CircularQueue.hpp"

class MergeSort final: public Sort {
   public:
      void operate() override;

      MergeSort(): Sort{} { OUTMES( "Derived default constructor." ); };

      MergeSort( const MergeSort& other ): Sort{ other } {
         OUTMES( "Derived copy constructor." );
      };   // Not require move semenetatic.

      MergeSort( MergeSort&& other ): Sort{ std::move( other ) } {
         OUTMES( "Derived move constructor." );
      };   // Require move semenetatic.

      explicit MergeSort( const std::vector< int >& vec ): Sort{ vec } {
         OUTMES( "Derived parameterized constructor with copy." );
      };

      explicit MergeSort( std::vector< int >&& vec ): Sort{ std::move( vec ) } {
         OUTMES( "Derived parameterized constructor with move semenetatic." );
      };

   private:
};

