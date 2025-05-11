#!/usr/bin/perl -w
use strict;

while(<>) {
  chomp;
  if (m|/usr/bin/perl|) {
    print "Matched: |$`<$&>$'|\n";
  }
  elsif (m|http://(\S+)#|) {
    print "Matched: |$`<$&>$'|\n";
  }
  elsif (m|//|) {
    print "Matched: |$`<$&>$'|\n";
  }
  else {
    print "No match: |$_|\n";
  }
}
