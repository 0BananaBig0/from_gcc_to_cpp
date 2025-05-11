#!/usr/bin/perl -w
use strict;

open my $input, '-|', 'perl', 'ex16-4.pl';

my $sum = 0;

while (<$input>) {
    $sum++ unless /e/;
}

print "The number of lines with an 'e' is $sum\n";
