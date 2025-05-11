#!/usr/bin/perl -w
use strict;

foreach my $file (@ARGV) {
    my $attrs = attributes($file);
    print "'$file' $attrs.\n";
}

sub attributes {
    my ($file) = shift @_;
    return "does not exists" unless -e $file;

    my @attr;
    push @attr, "readable"   if -r $file;
    push @attr, "writable"   if -w $file;
    push @attr, "executable" if -x $file;
    return "exists" unless @attr;
    'is ' . join " and ", @attr;
}    ## --- end sub attributes
