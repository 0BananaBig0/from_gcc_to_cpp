#!/usr/bin/perl -w
use strict;

# ascending order
foreach ( sort { -s $a <=> -s $b } glob(".* *") ) {

# descending order
# foreach ( sort { -s $b <=> -s $a } glob(".* *") ) {
    printf "%10d %-20s\n", ( -s $_ ), $_;
}
