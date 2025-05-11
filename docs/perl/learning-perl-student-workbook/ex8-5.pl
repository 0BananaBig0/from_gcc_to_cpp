#!/usr/bin/perl -w
use strict;

my %var_type = qw( $ scalar @ array % hash );

print "Please input a string: ";
chomp($_ = <STDIN>);
if (
  m/
  \A          # start of the string
  (           # start of capture
    [\$\@%]   # sign
  )           # end of capture
  [A-Za-z_]   # first character of name
  \w*         # the rest of name
  \z          # end of string
  /x
) {
  print "The variable type is $var_type{$1}\n";
}
else {
  print "The string is not a valid Perl variable name\n";
}
