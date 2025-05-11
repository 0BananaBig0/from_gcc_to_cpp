#!/usr/bin/perl -w
use strict;

use File::Spec;

my @ARGV = "/home/zhyu/";
my $dir  = $ARGV[0];

foreach my $file ( glob(".* *") ) {
    print File::Spec->catfile( $dir, $file ), "\n";
}
