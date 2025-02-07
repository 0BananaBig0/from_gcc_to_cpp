////////////////////////////////////////////////////////////////////////////////
///                           File Name: Sort.cpp                            ///
///                          Author: Huaxiao Liang                           ///
///                         Mail: 1184903633@qq.com                          ///
///                         02/07/2025-Fri-10:30:33                          ///
////////////////////////////////////////////////////////////////////////////////
#include "Sort.hpp"

// Implementation of `<<` operator
std::ostream& operator<<( std::ostream& os, const Sort& sort ) {
   os << "[ ";
   for( auto& ele: sort.getVec() ) {
      os << ele;
      os << " ";
   }
   os << "]";
   return os;
};

int generateRandomNum( int min, int max ) {
   // Random number generator
   std::random_device rd;      // Seed
   std::mt19937 gen( rd() );   // Mersenne Twister engine
   std::uniform_int_distribution< int > dis( min, max );
   return dis( gen );
};

std::vector< int > generateRandomVector( size_t size, int min, int max ) {
   // Generate vector with random values
   std::vector< int > vec( size );
   std::generate( vec.begin(), vec.end(), [&]() {
      return generateRandomNum( min, max );
   } );
   return vec;
};

std::ostream& operator<<( std::ostream& os, const std::vector< int >& vec ) {

   os << "[ ";
   for( auto& ele: vec ) {
      os << ele;
      os << " ";
   }
   os << "]";
   return os;
};

bool verify( const std::vector< int >& origin,
             const std::vector< int >& sorted ) {
   std::vector< int > tmp = origin;
   std::sort( tmp.begin(), tmp.end() );
   for( size_t i = 0; i < tmp.size(); i++ ) {
      if( tmp[i] != sorted[i] ) {
         return false;
      };
   };
   return true;
};

int testSort( Sort* sort, int test_count ) {
   int fail_count = 0;
   for( int i = 0; i < test_count; i++ ) {
      size_t size = generateRandomNum( 0, generateRandomNum( 1, 10000 ) );
      int min = generateRandomNum( INT32_MIN, INT32_MAX );
      int max = generateRandomNum( INT32_MIN, INT32_MAX );
      if( min > max ) {
         int tmp = min;
         min = max;
         max = tmp;
      };
      std::vector< int > origin
         = std::move( generateRandomVector( size, min, max ) );
      *sort = origin;
      sort->operate();
      if( !verify( origin, sort->getVec() ) ) {
         fail_count++;
      };
   };
   return fail_count;
};

