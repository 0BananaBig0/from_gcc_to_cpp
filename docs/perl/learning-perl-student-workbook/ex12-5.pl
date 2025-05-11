#!/usr/bin/perl -w
use 5.010;

foreach my $file (@ARGV) {
    print $file;

    if    ( -d $file ) { say '/'; }
    elsif ( -x $file ) { say '*'; }
    elsif ( defined( my $target = readlink($file) ) ) { say " --> $target"; }
    else                                              { say ''; }
}
