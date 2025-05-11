#!/usr/bin/perl -w
use 5.010;

say "Please input a string:";
chomp ($_ = <STDIN>);

if (m/a/) {
  $_ = $';
  if(/b/) {
    say "The string has an a, but a following b";
  }
  else {
    say "The string has an a without a following b";
  }
}
else {
  say "The string did not match";
}
