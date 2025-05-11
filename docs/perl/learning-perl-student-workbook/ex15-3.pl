#!/usr/bin/perl -w
use v5.10.1;

my @array = qw(Fred Wilma Barney Betty Larry Pebbles Bamm-Bamm);
say "The elements are: @array";
print "Please input a pattern ";
chomp( my $pattern = <STDIN> );

if ( /$pattern/ ~~ @array ) {
    say 'At least one element matches';
}
else {
    say 'No elements match';
}
