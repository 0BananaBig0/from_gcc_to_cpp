#!/usr/bin/perl -w
use 5.010;

foreach my $file (@ARGV) {
    say $file if -r -w -x $file;
}
