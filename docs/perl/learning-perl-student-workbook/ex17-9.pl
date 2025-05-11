#!/usr/bin/perl -w
use strict;

use List::MoreUtils qw(pairwise);

my @m = ( 1, 2, 3 );
my @n = ( 4, 6, 8 );

my @o = pairwise { $a + $b } @m, @n;

print "The sums are (@o)\n";
