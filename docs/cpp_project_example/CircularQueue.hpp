///////////////////////////////////////////////////////////////////////////
//  > File Name: CircularQueue.hpp
//  > Author: Huaxiao Liang
//  > Mail: 1184903633@qq.com
//  > Created Time: 01/14/2025-Tue-10:50:30
///////////////////////////////////////////////////////////////////////////

#pragma once
#include "Sort.hpp"

template< typename T > class CircularQueue {
   public:
      CircularQueue() = default;
      explicit CircularQueue( size_t vec_size ):
         _vec( vec_size ),
         _popIndex( 0 ),
         _pushIndex( 0 ),
         _count( 0 ) {};

      T pop() {
         if( _count == 0 ) {
            exit( 0 );
            return T( 0 );
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
            _vec.push_back( other );
         } else {
            _vec[_pushIndex] = other;
         }
         _count++;
         _pushIndex++;
         if( _pushIndex >= _vec.size() ) {
            _pushIndex -= _vec.size();
         };
      };

      size_t size() { return _count; };

   private:
      std::vector< T > _vec;
      size_t _popIndex;
      size_t _pushIndex;
      size_t _count;
};
