#!/usr/bin/perl -w
use strict;

foreach my $file ( glob('*') ) {
    my ( $atime, $mtime ) = ( stat $file )[ 8, 9 ];
    printf "%-20s %10d %10d\n", $file, $atime, $mtime;
}
