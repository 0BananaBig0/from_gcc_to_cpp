#!/usr/bin/perl -w
use strict;

opendir DOT, '.' or die "Can't opendir: $!\n";

printf "Name%40sSize\n";
printf "----%s----\n", '-' x 40;

while ( my $file = readdir DOT ) {
    next unless $file =~ /\.plx?$/i;
    printf "%-37s %10d\n", $file, -s $file;
}
closedir DOT
