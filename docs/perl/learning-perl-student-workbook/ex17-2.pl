#!/usr/bin/perl -w
use strict;
use Try::Tiny;

while (1) {
    print 'Please input a string: ';
    chomp( my $str = <STDIN> );
    last unless defined $str;

    print 'Please input a pattern: ';
    chomp( my $pattern = <STDIN> );

    try {
        if ( $str =~ /$pattern/ ) {
            print "The string matches.\n";
        }
        else {
            print "The string does not match.\n";
        }
    }
    catch {
        print "Can't use pattern: $@\n";
    }
}
