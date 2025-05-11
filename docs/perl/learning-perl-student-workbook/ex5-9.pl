#!/usr/bin/perl -w
use strict;

open my($fh), '<', $ARGV[0] or die "Could not open $ARGV[0]! $!";
print scalar <$fh>;
