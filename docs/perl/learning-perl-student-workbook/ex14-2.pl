#!/usr/bin/perl -w
use strict;

print "Please input some lines, end with Control-D.\n";

while (<>) {
    my $pos = rindex $_, 'e';

    if ( $pos != -1 ) {
        print "I found an e at position $pos.\n";
    }
    else {
        print "I didn't find any e\n";
    }
}
