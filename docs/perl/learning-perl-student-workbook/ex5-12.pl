#!/usr/bin/perl -w
use strict;

open my($fh), '<:crlf', $ARGV[0];

while(<$fh>) {
  print $_;
}
