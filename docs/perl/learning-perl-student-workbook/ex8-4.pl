#!/usr/bin/perl -w
use strict;

while(<>) {
  chomp;
  if (/\A(.+).*\g{1}/) {
    print "Matched: |$`<$&>$'|\n";
  }
  else {
    print "No match: |$_|\n";
  }
}
