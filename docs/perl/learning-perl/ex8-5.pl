#!/usr/bin/perl -w
use strict;

while(<>) {
  chomp;
  if (/\b(\w+a)\b(.{0,5})/s) {
    print "Matched: |$`<$&>$'|\n";
    print "\$1 is |$1|, \$2 is |$2|\n";
  }
  else {
    print "No match: |$_|\n";
  }
}
