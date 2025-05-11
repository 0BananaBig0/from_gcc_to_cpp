#!/usr/bin/perl -w
use strict;

while(<>) {
  chomp;
  if(/\s\z/) {
    print "|$_| is end of space\n";
  }
}
