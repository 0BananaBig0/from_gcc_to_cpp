#!/usr/bin/perl -w
use strict;

foreach (@ARGV) {
    unlink $_ or warn "Can't unlink $_: $!\n";
}
