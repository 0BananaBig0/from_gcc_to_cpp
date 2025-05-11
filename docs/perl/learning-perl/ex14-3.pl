#!/usr/bin/perl -w
use strict;

print "Please input a string: ";
chomp( my $str = <STDIN> );
print "Please input a substring: ";
chomp( my $substr = <STDIN> );

my  @indexs;
my  $pos   = -1;

while ( 1 ) {
    $pos = index($str, $substr, $pos+1);
    last if $pos == -1;
    push @indexs, $pos;
}

print "Locations of $substr in $str are: @indexs\n";
