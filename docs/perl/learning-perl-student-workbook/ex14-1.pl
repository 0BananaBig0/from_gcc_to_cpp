#!/usr/bin/perl -w
use strict;

print "Please input some lines, end with Control-D.\n";

while (<>) {
    my $pos = index $_, 'perl';

    if ( $pos != -1 ) {
        print "I found 'perl' at position $pos.\n";
    }
    else {
        print "I didn't find 'perl'\n";
    }
}
