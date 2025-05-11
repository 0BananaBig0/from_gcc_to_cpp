#!/usr/bin/perl -w
use strict;

my $max = 0;
foreach (@ARGV) {
  my $len = length $_;
  $max = $len if $len > $max;
}

foreach (@ARGV) {
  printf "%${max}d\n", $_;
}
