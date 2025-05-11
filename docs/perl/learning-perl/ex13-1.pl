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

my @files = <*>;

foreach my $file ( sort @files ) {
    print "$file\n";
}
