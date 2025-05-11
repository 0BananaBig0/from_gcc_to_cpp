#!/usr/bin/perl -w
use strict;

while(<>) {
  if(/([\S])\1/) {
    print;
  }
}
