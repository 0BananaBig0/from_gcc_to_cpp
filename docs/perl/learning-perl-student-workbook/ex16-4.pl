#!/usr/bin/perl -w
use strict;

foreach my $key ( keys %ENV ) {
    printf "%-30s %s\n", $key, $ENV{$key};
}
