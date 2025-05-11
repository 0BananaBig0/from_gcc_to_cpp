#!/usr/bin/perl -w
use strict;

my $sum = 0;

while (<>) {
    next if /^\s*$/;
    next if /^\s*#/;
    $sum++;
    last if /^__END__$/;
}
print "There were $sum lines.\n";
