/*************************************************************************
  > File Name: random_and_sum.cpp
  > Author: Huaxiao Liang
  > Mail: 1184903633@qq.com
  > Created Time: Thu 12 Dec 2024 02:40:10 PM CST
 ************************************************************************/

#include <iostream>
#include <random>
using namespace std;
mt19937::result_type seed = 0;
mt19937 gen( seed );
uniform_real_distribution< double > distr( 0, 1 );

int main() {
   double s = 0;
   for( auto i = 1; i <= 100000000; ++i ) {
      s += distr( gen );
   }
   std::cout << s;
   return 0;
}

