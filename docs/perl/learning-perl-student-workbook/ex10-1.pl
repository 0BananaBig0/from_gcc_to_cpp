#!/usr/bin/perl -w
use strict;

while (<>) {
    next if m/ruby|python/;
    print;
}
