#!/usr/bin/perl -w
use strict;

while (<>) {
  print $_, "\U$_", "\L$_", "\L\u$_";
}
