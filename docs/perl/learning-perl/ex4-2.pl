#!/usr/bin/perl -w
use strict;

sub total {
  my $sum;
  foreach (@_) {
  	$sum += $_;
  }
  $sum;
}

print "The sum from 1 to 1000 is ", total(1 .. 1000), ".\n";
