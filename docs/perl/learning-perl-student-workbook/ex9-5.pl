#!/usr/bin/perl -w
use strict;

while (<>) {
  print $_, "\U$_", "\L$_";
  my $str = "\L$_";
  $str =~ s/\b(\w)/\U$1/g;
  print $str;
}
