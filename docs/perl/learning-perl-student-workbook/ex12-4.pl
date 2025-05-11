#!/usr/bin/perl -w
use strict;

printf "  %20b\n", $ARGV[0];
printf "& %20b\n", $ARGV[1];
printf "  %20s\n", "-" x 20;
printf "  %20b\n", $ARGV[0] & $ARGV[1];
