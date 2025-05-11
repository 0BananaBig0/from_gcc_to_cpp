#!/usr/bin/perl -w
use strict;

print format_number( 9999 ), "\n";

sub format_number {
  local $_ = shift;

  1 while s/^([-+]?\d+)(\d{3})/$1,$2/;

  $_;
}
