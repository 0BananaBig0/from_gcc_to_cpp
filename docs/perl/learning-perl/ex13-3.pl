#!/usr/bin/perl -w
use strict;

print "Please input a directory(your home directory as default): ";
chomp( my $dir = <STDIN> );

if ( $dir =~ /\A\s\Z/ ) {
    chdir or die "Can't chdir to your home directory: $!";
}
else {
    chdir $dir or die "Can't chdir to $dir: $!";
}

opendir DOT, '.' or die "Can't opendir dot: $!";
foreach my $file ( sort readdir DOT ) {
    print "$file\n";
}
