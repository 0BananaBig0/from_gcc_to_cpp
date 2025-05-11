#!/usr/bin/perl -w
use strict;

while(<>) {
  chomp;
  if (/\A[^abx]/) {
    print "Matched at beginning: |$`<$&>$'|\n";
  }
  elsif (/[^abx]\z/) {
    print "Matched at end: |$`<$&>$'|\n";
  }
  else {
    print "No match: |$_|\n";
  }
}
