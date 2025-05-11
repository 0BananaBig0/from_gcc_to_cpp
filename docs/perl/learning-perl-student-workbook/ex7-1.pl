#!/usr/bin/perl -w
use 5.010;

say "Please input a string:";
chomp($_=<STDIN>);

if (m/fred|barney/) {
  say "Before: $`\tName: $&\tAfter: $'";
}
else {
  say "The string did not match";
}
