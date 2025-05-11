#!/usr/bin/perl -w
use strict;

$^I = ".bak";

while (<>) {
  if (/\A#!/) {
    $_ .= "## Copyright (C) 2014 by Yours Truly\n";
  }
  print;
}
