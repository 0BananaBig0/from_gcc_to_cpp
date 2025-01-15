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

void MergeSort::operate() {
   // One element, the result = the input.
   if( _vec.size() < 2 ) {
      return;
   }

   CircularQueue< std::vector< int >* > que( _vec.size() );
   for( size_t i = 0; i < _vec.size(); i++ ) {
      que.push( new std::vector< int >{ _vec[i] } );
   }

   std::mutex que_mtx;
   bool finished = false;
   auto merge = [&]( std::vector< int >* vec1, std::vector< int >* vec2 ) {
      size_t len = vec1->size() + vec2->size();
      std::vector< int >* res;
      if( len == _vec.size() ) {
         // The last thread, store the result into the original vector.
         res = &( _vec );
      } else {
         res = new std::vector< int >( len );
      }

      // Merge
      for( size_t il = 0, i1 = 0, i2 = 0; il < len; il++ ) {
         if( ( i1 < vec1->size() && i2 < vec2->size()
               && ( *vec1 )[i1] < ( *vec2 )[i2] )
             || ( i1 < vec1->size() && i2 >= vec2->size() ) ) {
            ( *res )[il] = ( *vec1 )[i1++];
         } else {
            ( *res )[il] = ( *vec2 )[i2++];
         }
      };
      delete vec1;
      delete vec2;

      if( len == _vec.size() ) {
         // The last thread.
         finished = true;
         return;
      }
      // Store the result.
      que_mtx.lock();
      que.push( res );
      que_mtx.unlock();
      return;
   };
   while( !finished ) {
      if( que.size() > 1 ) {
         que_mtx.lock();
         auto vec1 = que.pop();
         auto vec2 = que.pop();
         que_mtx.unlock();
         auto get_res = std::async( merge, vec1, vec2 );
      };
   };
};
