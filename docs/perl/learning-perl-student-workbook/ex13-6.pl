#!/usr/bin/perl -w
use strict;

printf "Name%40sSize\n";
printf "----%s----\n", '-' x 40;

while ( my $file = glob('.* *') ) {
    next unless $file =~ /\.plx?$/i;
    printf "%-37s %10d\n", $file, -s $file;
}
