#!/usr/bin/perl -w
use v5.10.1;

my @array = qw(Fred Wilma Barney Betty Larry Pebbles Bamm-Bamm);
say "The elements are: @array";
print "Please input a name: ";
chomp( my $name = <STDIN> );

if ( $name ~~ @array ) {
    say 'I found a matching name';
}
else {
    say "I didn't find a matching name";
}
