#!/usr/bin/perl -w
use strict;

my  %count;
while (<>) {
    chomp;
    $_ = "\L$_";
    s/[^a-z]/ /g;


    foreach my $word ( split ) {
        $count{$word}++;
    }
}


foreach my $word ( keys %count ) {
    printf "%-20s %3d\n", $word, $count{$word};
}
