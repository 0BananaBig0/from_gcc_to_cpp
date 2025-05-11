#!/usr/bin/perl -w
use 5.010;

say "Please input a string:";
chomp ($_ = <STDIN>);

if (/\p{Space}/) {
  say "Found a type of space.";
}
if (/\p{Number}/) {
  say "Found a type of number.";
}
