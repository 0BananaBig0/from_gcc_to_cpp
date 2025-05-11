#!/usr/bin/perl -w
use strict;

use File::Basename;
use File::Spec;

my $symlink = $ARGV[0] eq '-s';
shift @ARGV if $symlink;

my ( $src, $dest ) = @ARGV;

if ( -d $dest ) {
    my $basename = basename $src;
    $dest = File::Spec->catfile( $dest, $basename );
}

if ($symlink) {
    symlink $src => $dest
        or die "Can't make symbol link from $src to $dest: $!\n";
}
else {
    link $src => $dest or die "Can't make hard link from $src to $dest: $!\n";
}
