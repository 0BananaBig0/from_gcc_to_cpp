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

      MergeSort(): Sort{}, _que(), _finished{ false } {
         OUTMES( "Derived default constructor." );
      };

      MergeSort( const MergeSort& other ):
         Sort{ other },
         _que( _vec.size() ),
         _finished{ false } {
         OUTMES( "Derived copy constructor." );
      };   // Not require move semenetatic.

      MergeSort( MergeSort&& other ):
         Sort{ std::move( other ) },
         _que( _vec.size() ),
         _finished{ false } {
         OUTMES( "Derived move constructor." );
      };   // Require move semenetatic.

      explicit MergeSort( const std::vector< int >& vec ):
         Sort{ vec },
         _que( _vec.size() ),
         _finished{ false } {
         OUTMES( "Derived parameterized constructor with copy." );
      };

      explicit MergeSort( std::vector< int >&& vec ):
         Sort{ std::move( vec ) },
         _que( _vec.size() ),
         _finished{ false } {
         OUTMES( "Derived parameterized constructor with move semenetatic." );
      };

      ~MergeSort() override {
         while( _que.size() > 0 ) {
            auto ele = _que.pop();
            delete ele;
         }
      };

   private:
      std::mutex _queueMtx;
      CircularQueue< std::vector< int >* > _que;
      bool _finished;
};

void MergeSort::operate() {
   auto merge = [&]( std::vector< int >* vec1, std::vector< int >* vec2 ) {
      size_t len = vec1->size() + vec2->size();
      std::vector< int >* res;
      if( len == _vec.size() ) {
         _finished = true;
         res = &( _vec );
      } else {
         res = new std::vector< int >( len );
      }
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
         return res;
      }
      _queueMtx.lock();
      _que.push( res );
      _queueMtx.unlock();
      return res;
   };
   if( _vec.size() < 2 ) {
      _finished = true;
      return;
   }
   for( size_t i = 0; i < _vec.size(); i++ ) {
      _que.push( new std::vector< int >{ _vec[i] } );
   }
   std::future< std::vector< int >* > get_res;
   while( !_finished ) {
      if( _que.size() > 1 ) {
         _queueMtx.lock();
         auto vec1 = _que.pop();
         auto vec2 = _que.pop();
         _queueMtx.unlock();
         get_res = std::async( merge, vec1, vec2 );
      }
   }
   get_res.wait();
};
