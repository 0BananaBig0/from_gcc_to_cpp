///////////////////////////////////////////////////////////////////////////
//  > File Name: CircularQueue.hpp
//  > Author: Huaxiao Liang
//  > Mail: 1184903633@qq.com
//  > Created Time: 01/14/2025-Tue-10:50:30
///////////////////////////////////////////////////////////////////////////

#pragma once
#include <cstddef>
#include <cstdlib>
#include <vector>

template< typename T > class CircularQueue {
   public:
      CircularQueue():
         _vec( 0 ),
         _popIndex( 0 ),
         _pushIndex( 0 ),
         _count( 0 ) {};
      explicit CircularQueue( size_t vec_size ):
         _vec( vec_size ),
         _popIndex( 0 ),
         _pushIndex( 0 ),
         _count( 0 ) {};

      T pop() {
         if( _count == 0 ) {
            exit( 0 );
            return T{};
         };
         size_t tmp = _popIndex;
         _count--;
         _popIndex++;
         if( _popIndex >= _vec.size() ) {
            _popIndex -= _vec.size();
         };
         return _vec[tmp];
      };

      void push( const T& other ) {
         if( _count >= _vec.size() ) {
            _vec.emplace_back( other );
            _pushIndex = 0;
         } else {
            _vec[_pushIndex] = other;
            _pushIndex++;
         }
         _count++;
         if( _pushIndex >= _vec.size() ) {
            _pushIndex -= _vec.size();
         };
      };

      // Manually push.
      // Prevent invalid pointers or references.
      size_t push() {
         size_t man_index = _pushIndex;
         if( _count >= _vec.size() ) {
            _vec.emplace_back( T{} );
            _pushIndex = 0;
            man_index = _vec.size() - 1;
         } else {
            _pushIndex++;
         }
         _count++;
         if( _pushIndex >= _vec.size() ) {
            _pushIndex -= _vec.size();
         };
         return man_index;
      };

      size_t size() { return _count; };

   private:
      friend class MergeSortLayerByLayer;
      std::vector< T > _vec;
      size_t _popIndex;    // Current pop.
      size_t _pushIndex;   // Next push, empty now.
      size_t _count;       // The number of stored results.
};
