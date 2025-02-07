///////////////////////////////////////////////////////////////////////////
//  > File Name: MergeSortLayerByLayer.hpp
//  > Author: Huaxiao Liang
//  > Mail: 1184903633@qq.com
//  > Created Time: 01/14/2025-Tue-10:50:15
///////////////////////////////////////////////////////////////////////////

#pragma once
#include "Sort.hpp"
#include "CircularQueue.hpp"

class MergeSortLayerByLayer final: public Sort {
   public:
      void operate() override;

      MergeSortLayerByLayer(): Sort{} {
         OUTMES( "Derived default constructor." );
      };

      MergeSortLayerByLayer( const MergeSortLayerByLayer& other ):
         Sort{ other } {
         OUTMES( "Derived copy constructor." );
      };   // Not require move semenetatic.

      MergeSortLayerByLayer( MergeSortLayerByLayer&& other ):
         Sort{ std::move( other ) } {
         OUTMES( "Derived move constructor." );
      };   // Require move semenetatic.

      explicit MergeSortLayerByLayer( const std::vector< int >& vec ):
         Sort{ vec } {
         OUTMES( "Derived parameterized constructor with copy." );
      };

      explicit MergeSortLayerByLayer( std::vector< int >&& vec ):
         Sort{ std::move( vec ) } {
         OUTMES( "Derived parameterized constructor with move semenetatic." );
      };

   private:
};

struct VecInfo {
      size_t _startId;
      size_t _endId;   // Not store.
};

