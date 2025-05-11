#!/usr/bin/perl -w
use 5.010;

use List::Util qw(sum reduce);

say 'The sum of 1 to 1000 is ', sum( 1 ... 1000 );
say 'The sum of 1 to 1000 is ', reduce { $a + $b } 1 ... 1000;
