///////////////////////////////////////////////////////////////////////////
//  > File Name: Sort.hpp
//  > Author: Huaxiao Liang
//  > Mail: 1184903633@qq.com
//  > Created Time: 01/14/2025-Tue-10:49:03
///////////////////////////////////////////////////////////////////////////
#pragma once
#include <iostream>
#include <algorithm>
#include <future>
#include <iostream>
#include <mutex>
#include <random>
#include <vector>
#ifdef PRINT_MES
   #define OUTMES( inf ) std::cout << inf << std::endl;
#else
   #define OUTMES( inf ) ;
#endif
class Sort {
   public:
      virtual void operate() { return; };

      Sort() { OUTMES( "Default constructor." ); };

      Sort( const Sort& other ) {
         OUTMES( "Copy constructor." );
         if( this != &other ) {
            _vec = other.getVec();
         };
      };   // Not require move semenetatic.

      Sort( Sort&& other ) {
         OUTMES( "Move constructor." );
         if( this != &other ) {
            _vec = std::move( other.getVec() );
         };
      };   // Require move semenetatic.

      explicit Sort( const std::vector< int >& vec ): _vec{ vec } {
         OUTMES( "Parameterized constructor with copy." );
      };

      explicit Sort( std::vector< int >&& vec ): _vec{ std::move( vec ) } {
         OUTMES( "Parameterized constructor with move semenetatic." );
      };

      virtual ~Sort() = default;

      const std::vector< int >& getVec() const {
         OUTMES( "lvalue" );
         return _vec;
      };   // Not allow move sementatic.

      std::vector< int >&& getVec() {
         OUTMES( "rvalue" );
         return std::move( _vec );
      };   // Allow move sementatic.

      Sort& operator=( const Sort& other ) {
         OUTMES( "Copy assignment." );
         if( this != &other ) {
            _vec = other.getVec();
         };
         return *this;   // Allow chain assignment.
      };   // Not require move semenetatic.

      Sort& operator=( Sort&& other ) {
         OUTMES( "Move assignment." );
         if( this != &other ) {
            _vec = std::move( other.getVec() );
         };
         return *this;
      };   // Require move sementatic.

      // Friend function to overload `<<`
      // Why require `friend`:
      // The << operator is typically implemented as a non-member function
      // because the left-hand operand (std::ostream) is not part of the class.
      friend std::ostream& operator<<( std::ostream& os, const Sort& sort );

      Sort operator+( const Sort& other ) {
         OUTMES( "*This + other." );
         std::vector< int > res = _vec;
         if( _vec.size() == other.getVec().size() ) {
            for( size_t i = 0; i < _vec.size(); i++ ) {
               res[i] = res[i] + other.getVec()[i];
            }
         }
         return Sort( std::move( res ) );
      };

      Sort& operator+=( const Sort& other ) {
         OUTMES( "*This += other." );
         if( _vec.size() == other.getVec().size() ) {
            for( size_t i = 0; i < _vec.size(); i++ ) {
               _vec[i] += other.getVec()[i];
            }
         }
         return *this;   // Allow chain rules.
      };

      bool operator<( const Sort& other ) const {
         OUTMES( "*This < other?" );
         if( _vec.size() == other.getVec().size() ) {
            for( size_t i = 0; i < _vec.size(); i++ ) {
               return _vec[i] < other.getVec()[i];
            }
         }
         return _vec[0];
      };

      // Overload prefix increment (++x)
      Sort& operator++() {
         OUTMES( "++( *This )." );
         for( auto& val: _vec ) {
            ++val;
         };
         return *this;   // Return the updated object
      }

      // Overload postfix increment (x++)
      // The dummy `int` parameter differentiates the postfix increment from
      // prefix increment. The parameter is not used but is necessary for the
      // signature.
      Sort operator++( int ) {
         OUTMES( "( *This )++." );
         Sort temp = *this;   // Save the current state
         for( auto& val: _vec ) {
            ++val;
         };
         return temp;   // Return the original state
      }

   protected:
      std::vector< int > _vec;
};

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

std::vector< int > generateRandomVector( size_t size, int min, int max ) {
   // Random number generator
   std::random_device rd;                             // Seed
   std::mt19937 gen( rd() );                          // Mersenne Twister engine
   std::uniform_int_distribution<> dis( min, max );   // Uniform
                                                      // distribution
   // Generate vector with random values
   std::vector< int > vec( size );
   std::generate( vec.begin(), vec.end(), [&]() { return dis( gen ); } );
   return vec;
}

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
