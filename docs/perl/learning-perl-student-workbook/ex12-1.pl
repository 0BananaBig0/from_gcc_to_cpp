#!/usr/bin/perl -w
use 5.010;

foreach my $file (@ARGV) {
    print $file;

    if    ( -d $file ) { say '/'; }
    elsif ( -x $file ) { say '*'; }
    elsif ( -l $file ) { say '@'; }
    else               { say ''; }
}
