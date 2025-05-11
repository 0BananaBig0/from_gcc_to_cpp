#!/usr/bin/perl -w
use strict;

while(<>) {
  chomp;
  if (/[abx]/i) {
    print "Matched: |$`<$&>$'|\n";
  }
  else {
    print "No match: |$_|\n";
  }
}
