#!/usr/bin/perl -w
use strict;

my @files = glob('.* *');
my ( $count, $size ) = ( 0, 0 );

foreach my $file (@files) {
    next if -d $file;
    $count++;
    $size += -s $file;
}
print "I found $count file(s) with total size $size bytes\n";
