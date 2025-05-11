#!/usr/bin/perl -w
use strict;

while (<>) {
  print join "|", split /\t/;
}
