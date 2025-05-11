#!/usr/bin/perl -w
use strict;

use File::Basename;
use File::Spec;

my ( $src, $dest ) = @ARGV;

if ( -d $dest ) {
    my $basename = basename $src;
    $dest = File::Spec->catfile( $dest, $basename );
}

rename $src => $dest or die "Can't rename $src to $dest: $!\n";
