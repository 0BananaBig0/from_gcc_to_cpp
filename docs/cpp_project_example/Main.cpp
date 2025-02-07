/*************************************************************************
  > File Name: Main.cpp
  > Author: Huaxiao Liang
  > Mail: 1184903633@qq.com
  > Created Time: Sun 06 Oct 2024 02:51:12 PM CST
 ************************************************************************/

#include "Header.h"
#include "FunHeader.h"
#include "Sort.hpp"
#include "CircularQueue.hpp"
#include "MergeSort.hpp"
#include "MergeSortLayerByLayer.hpp"
#include "BubbleSort.hpp"
#include "SelectionSort.hpp"

int main() {
   // tPrint();
   // ttPrint();
#ifdef TEST_SORT
   std::cout << "All tests are running:\n";
   int fail_count = testSort( new MergeSort(), 10 );
   if( fail_count > 0 ) {
      std::cout << "Fail " << fail_count << " times.";
   } else {
      std::cout << "All tests have completed successfully.\n";
   };
#endif

   std::vector< int > ovec = generateRandomVector( 64, 0, 100000 );
   MergeSort msort_vec( ovec );
   // std::cout << "Before sorted:" << msort_vec << std::endl;
   auto start = std::chrono::high_resolution_clock::now();
   msort_vec.operate();
   auto end = std::chrono::high_resolution_clock::now();
   auto dur
      = std::chrono::duration_cast< std::chrono::milliseconds >( end - start );
   std::cout << "Elapsed time: " << dur.count() << " ms.\n";

   SelectionSort ssort_vec( ovec );
   start = std::chrono::high_resolution_clock::now();
   ssort_vec.operate();
   end = std::chrono::high_resolution_clock::now();
   dur = std::chrono::duration_cast< std::chrono::milliseconds >( end - start );
   std::cout << "Elapsed time: " << dur.count() << " ms.\n";
   return 0;
}

