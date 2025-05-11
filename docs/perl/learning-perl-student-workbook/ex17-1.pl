#!/usr/bin/perl -w
use strict;

while (1) {
    print 'Please input a string: ';
    chomp( my $str = <STDIN> );
    last unless defined $str;

    print 'Please input a pattern: ';
    chomp( my $pattern = <STDIN> );

    eval {
        if ( $str =~ /$pattern/ ) {
            print "The string matches.\n";
        }
        else {
            print "The string does not match.\n";
        }
    };
    print "Can't use pattern: $@\n" if $@;
}
