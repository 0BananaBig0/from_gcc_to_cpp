#!/usr/bin/perl -w
use strict;

my @files = glob('.* *');
my $count = @files - 2;
print "I found $count file(s)\n";
