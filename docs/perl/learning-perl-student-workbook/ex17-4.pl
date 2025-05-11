#!/usr/bin/perl -w
use strict;

my @squares = map { $_**2 } 1 ... 10;
print "Squares of numbers from 1 to 10 are: @squares\n";
