#!/usr/bin/perl -w
use strict;

foreach my $file ( glob('.* *') ) {
    my $dest = readlink $file;
    print "$file -> $dest\n" if defined $dest;
}
