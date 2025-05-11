#!/usr/bin/perl -w
use strict;

foreach ( sort { -M $a <=> -M $b } glob(".* *") ) {
    my @stat = stat;
    printf "%24s\t%-20s\n", scalar localtime $stat[9], $_;
}
