#!/usr/bin/perl -w
use strict;

my @threes = grep { !( $_ % 3 ) } 1 ... 1000;
print "Multiples of 3 between 1 and 1000 are: @threes\n";
