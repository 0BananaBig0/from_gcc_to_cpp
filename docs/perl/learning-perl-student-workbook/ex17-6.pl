#!/usr/bin/perl -w
use strict;

my @numbers = 0 ... 1000;

my ( $first, $last ) = @numbers[ 0, -1 ];
print "first is $first, last is $last\n";

( $first, $last ) = @numbers[ -1, 0 ];
print "first is $first, last is $last\n";

my @first_ten = @numbers[ 0 ... 9 ];
print "First ten numbers are @first_ten\n";

my @odd = @numbers[ grep { $_ % 2 } 0 ... $#numbers ];
print "Odd numbers are @odd\n";
