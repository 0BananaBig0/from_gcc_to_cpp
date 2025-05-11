#!/usr/bin/perl -w
use strict;

my $secret = int( 1 + rand 100 );

while (1) {
    print "Please input a guess from 1 to 100: ";
    chomp( my $guess = <STDIN> );
    if ( $guess =~ /quit|exit|\A\s*\z/i ) {
        print "The number is $secret.\n";
        last;
    }
    elsif ( $guess == $secret ) {
        print "You got it!\n";
        last;
    }
    elsif ( $guess < $secret ) {
        print "Too small. Try again!\n";
    }
    else {
        print "Too large. Try again!\n";
    }
}
