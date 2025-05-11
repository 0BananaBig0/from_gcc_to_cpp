#!/usr/bin/perl -w
use 5.010;

say "Please input a string:";
chomp ($_ = <STDIN>);

if (/(...+).*\g{-1}/) {
  say "Found a repeated $1";
}
else {
  say "The string did not match";
}
