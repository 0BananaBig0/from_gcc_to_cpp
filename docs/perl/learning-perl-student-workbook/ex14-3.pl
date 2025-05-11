#!/usr/bin/perl -w
use strict;

my $start = shift @ARGV;
my $end   = shift @ARGV;
my $len   = $end - $start + 1;
print "Length is $len.\n";

while (<>) {
    chomp;
    print "|", substr( $_, $start, $len ), "|\n";
}
