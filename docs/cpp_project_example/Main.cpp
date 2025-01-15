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
   // size_t num_of_test = 0;
   // int min_number = 0;
   // int max_number = INT32_MAX;
   // std::cout << "Type the number of test patterns:" << std::endl;
   // std::cin >> num_of_test;
   // std::cout << "Type the minimum number in the test patterns:" << std::endl;
   // std::cin >> min_number;
   // std::cout << "Type the maximum number in the test patterns:" << std::endl;
   // std::cin >> max_number;
   // std::vector< int > ovec
   //    = generateRandomVector( num_of_test, min_number, max_number );
   std::vector< int > ovec = generateRandomVector( 100000, 0, 100000 );
   MergeSort msort_vec( ovec );
   SelectionSort ssort_vec( ovec );
   // std::cout << "Before sorted:" << msort_vec << std::endl;
   auto start = std::chrono::high_resolution_clock::now();
   msort_vec.operate();
   auto end = std::chrono::high_resolution_clock::now();
   auto dur
      = std::chrono::duration_cast< std::chrono::milliseconds >( end - start );
   std::cout << "Elapsed time: " << dur.count() << " ms.\n";
   start = std::chrono::high_resolution_clock::now();
   ssort_vec.operate();
   end = std::chrono::high_resolution_clock::now();
   dur = std::chrono::duration_cast< std::chrono::milliseconds >( end - start );
   std::cout << "Elapsed time: " << dur.count() << " ms.\n";
   // std::cout << "After sorted:" << msort_vec << std::endl;
   if( verify( ovec, msort_vec.getVec() ) ) {
      std::cout << "The result is correct." << std::endl;
   } else {
      std::cout << "The result is wrong." << std::endl;
   };
   return 0;
}
