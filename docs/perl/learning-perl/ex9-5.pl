#!/usr/bin/perl -w
use strict;

my %filename;
foreach (@ARGV) {
  $filename{$_} = 1;
}

while (<>) {
  if (/\A## Copyright/) {
    delete $filename{$ARGV};
  }
}

@ARGV = sort keys %filename;
$^I = ".bak";
while (<>) {
  if (/\A#!/) {
    $_ .= "## Copyright (C) 2014 by Yours Truly\n";
  }
  print;
}
