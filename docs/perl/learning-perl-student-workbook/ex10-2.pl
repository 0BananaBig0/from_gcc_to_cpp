#!/usr/bin/perl -w
use strict;

while (<>) {
    last if m/perl/;
}
print "There were $. lines until I found perl.\n";
