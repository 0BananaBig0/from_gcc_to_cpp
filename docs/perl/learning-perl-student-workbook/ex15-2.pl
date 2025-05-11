#!/usr/bin/perl -w
use v5.10.1;

my %hash = qw(
    Fred Flintstone
    Wilma Flintstone
    Barney Rubble
    Betty Rubble
    Larry Slate
    Pebbles Flintstone
    Bamm-Bamm Rubble
);

say 'The keys are [', join( ' ', keys %hash ), ']';
say 'Please input some names, end with Control-D:';
chomp( my @names = <STDIN> );

if ( @names ~~ %hash ) {
    say 'I found a matching name';
}
else {
    say "I didn't find a matching name";
}
