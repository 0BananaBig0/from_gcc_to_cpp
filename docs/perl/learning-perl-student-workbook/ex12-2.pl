#!/usr/bin/perl -w
use strict;

foreach my $file (@ARGV) {
    my (undef, undef, undef, undef,  undef,
        undef, undef, undef, $atime, $mtime
    ) = stat $file;

    printf "%-15s\t%24s\t%24s\n", $file, scalar localtime($atime),
        scalar localtime($mtime);
}
