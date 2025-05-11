#!/usr/bin/perl -w
use strict;

my $atime = time - 5 * 60;

foreach my $file (@ARGV) {
    my @stat  = stat($file);
    my $mtime = $stat[9];

    utime $atime, $mtime, $file or warn "Can't set access time: $!\n";
}
