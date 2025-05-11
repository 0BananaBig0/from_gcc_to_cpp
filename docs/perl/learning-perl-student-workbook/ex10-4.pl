#!/usr/bin/perl -w
use strict;

for ( my $num = 3; $num <= 99; $num += 3 ) {
    printf "%2d\t%4d\t%6d\n", $num, $num**2, $num**3;
}
