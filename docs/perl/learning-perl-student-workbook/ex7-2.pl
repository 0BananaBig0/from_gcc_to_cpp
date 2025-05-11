#!/usr/bin/perl -w
use 5.010;

say "Please input a string:";
chomp ($_ = <STDIN>);

if (/a.*b.*c/) {
  say "The string has a, b, and c";
}
else {
  say "The string did not match";
}
