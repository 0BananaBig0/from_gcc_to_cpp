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

void MergeSortLayerByLayer::operate() {
   // One element, the result = the input.
   if( _vec.size() < 2 ) {
      return;
   }

   CircularQueue< VecInfo > que( _vec.size() );
   for( size_t i = 0; i < _vec.size(); i++ ) {
      que.push( VecInfo{ i, i + 1 } );
   };

   std::mutex que_mtx;
   std::atomic_size_t count_finished_threads = 0;
   size_t count_needed_threads = 0;
   auto merge = [&]( VecInfo vec_info1,
                     VecInfo vec_info2,
                     const std::vector< int >& vec_get,
                     std::vector< int >& vec_sto,
                     auto ssid ) {
      // Compute the _endId for the result.
      size_t sdid = vec_info1._endId - vec_info1._startId + vec_info2._endId
                  - vec_info2._startId + ssid;

      // Merge.
      for( size_t il = ssid, i1 = vec_info1._startId, i2 = vec_info2._startId;
           il < sdid;
           il++ ) {
         if( ( i1 < vec_info1._endId && i2 < vec_info2._endId
               && vec_get[i1] < vec_get[i2] )
             || ( i1 < vec_info1._endId && i2 >= vec_info2._endId ) ) {
            vec_sto[il] = vec_get[i1++];
         } else {
            vec_sto[il] = vec_get[i2++];
         };
      };

      // Store the VecInfo of the result.
      que_mtx.lock();
      auto push_id = que.push();
      que_mtx.unlock();
      que._vec[push_id]._startId = ssid;
      que._vec[push_id]._endId = sdid;
      // Used to determine whether all sub threads finished.
      count_finished_threads++;
   };
   // Used to process the last element, if the number of tasks is odd.
   auto move = [&]( const std::vector< int >& vec_get,
                    std::vector< int >& vec_sto,
                    auto ssid ) {
      // Not pop it, just update its information.
      VecInfo vec_info = que._vec[que._popIndex];
      size_t sdid = ssid + vec_info._endId - vec_info._startId;
      que._vec[que._popIndex]._startId = ssid;
      que._vec[que._popIndex]._endId = sdid;
      for( size_t il = ssid, i = vec_info._startId; il < sdid; il++ ) {
         vec_sto[il] = vec_get[i++];
      };
      count_finished_threads++;
   };

   // Used to determine which vector is vec_sto, which is vec_get.
   // true: vec_sto = vec_tmp, vec_get = _vec;
   // false: vec_sto = _vec, vec_get = vec_tmp;
   bool tmp_or_vec = ( static_cast< size_t >(
                          ceil( log2( static_cast< double >( _vec.size() ) ) ) )
                       % 2 )
                      ? false
                      : true;
   auto vec_tmp = _vec;

   // The last layer only owns one sub threads.
   while( !( count_needed_threads == count_finished_threads
             && count_needed_threads == 1 ) ) {
      // Layer by layer, all threads related to the current layer finished?
      if( count_needed_threads != count_finished_threads ) {
         continue;
      };
      // Odd number of taks, require to move the last task.
      bool move_or_not = que.size() % 2;
      count_needed_threads = ( move_or_not ) ? ( que.size() / 2 + 1 )
                                             : que.size() / 2;
      count_finished_threads = 0;
      size_t stored_start_id = 0;
      for( size_t i = 0; i < count_needed_threads; i++ ) {
         if( move_or_not && ( i == count_needed_threads - 1 ) ) {
            // Move the last single task.
            if( tmp_or_vec ) {
               std::thread thp( move,
                                std::cref( _vec ),
                                std::ref( vec_tmp ),
                                stored_start_id );
               thp.detach();
            } else {
               std::thread thp( move,
                                std::cref( vec_tmp ),
                                std::ref( _vec ),
                                stored_start_id );
               thp.detach();
            };
         } else {
            // One sub thread process two tasks.
            que_mtx.lock();
            auto vec_info1 = que.pop();
            auto vec_info2 = que.pop();
            que_mtx.unlock();
            if( tmp_or_vec ) {
               std::thread thp( merge,
                                vec_info1,
                                vec_info2,
                                std::cref( _vec ),
                                std::ref( vec_tmp ),
                                stored_start_id );
               thp.detach();
            } else {
               std::thread thp( merge,
                                vec_info1,
                                vec_info2,
                                std::cref( vec_tmp ),
                                std::ref( _vec ),
                                stored_start_id );
               thp.detach();
            };
            stored_start_id = stored_start_id + vec_info1._endId
                            - vec_info1._startId + vec_info2._endId
                            - vec_info2._startId;
         };
      };
      tmp_or_vec = !tmp_or_vec;
   };
};
