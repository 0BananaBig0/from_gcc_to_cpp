#!/usr/bin/perl -w
use strict;

my $str = "fRED has score 230
barney has score 190
DINO has score 30";

$str =~ s/^(\S+)/\u\L$1/mg;
print $str;
