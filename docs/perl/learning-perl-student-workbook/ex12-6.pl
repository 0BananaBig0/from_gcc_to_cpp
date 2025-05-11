#!/usr/bin/perl -w
use strict;

foreach my $file (@ARGV) {
    my @stat;

    if   ( -l $file ) { @stat = lstat $file; }
    else              { @stat = stat $file; }

    my (undef, undef, undef, undef,  undef,
        undef, undef, undef, $atime, $mtime
    ) = @stat;

    printf "%-15s\t%24s\t%24s\n", $file, scalar localtime($atime),
        scalar localtime($mtime);
}
