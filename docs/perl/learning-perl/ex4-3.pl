#!/usr/bin/perl -w
use strict;

sub get_average {
  my $sum;
  foreach (@_) {
    $sum += $_;
  }
  $sum / @_;
}

sub above_average {
  my $average = get_average(@_);
  my @arr;
  foreach (@_) {
    if ($_ > $average) {
      push @arr, $_;
    }
  }
  @arr;
}

my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";
