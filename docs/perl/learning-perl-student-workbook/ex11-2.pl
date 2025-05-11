#!/usr/bin/perl -w
use strict;

use File::Basename;

my $format = "%-50s\t%-10s\n";

printf $format, "Directory", "Name";

while (<>) {
    chomp;

    printf $format, dirname($_), basename($_);
}
