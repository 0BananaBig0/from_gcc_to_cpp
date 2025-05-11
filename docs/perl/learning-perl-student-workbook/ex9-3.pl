#!/usr/bin/perl -w
use strict;

my @strs;
my @indexs = qw( first second third );
foreach my $index (@indexs) {
  print "Please input the $index string: ";
  chomp( my $str = <> );
  push @strs, $str;
}

print "Please input a regular expression: ";
chomp( my $regex = <> );

foreach my $index ( 0 .. $#strs) {
  if ($strs[$index] =~ m/$regex/ ) {
    print "The $indexs[$index] line matches\n";
  }
  else {
    print "The $indexs[$index] line does not match\n";
  }
}
