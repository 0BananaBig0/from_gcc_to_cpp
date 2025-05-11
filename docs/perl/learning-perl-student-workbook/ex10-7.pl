#!/usr/bin/perl -w
use strict;

my $num = int( rand 10 ) + 1;

{
    print 'Guess the number: ';
    my $guess = <STDIN>;

    if ( $guess == $num ) {
        print "You got it.\n";
        last;
    }
    else {
        redo;
    }
}
