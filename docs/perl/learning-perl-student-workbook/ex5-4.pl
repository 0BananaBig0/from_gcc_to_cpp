#!/usr/bin/perl -w
use 5.010;

say "Please input a number:";
my $number = <STDIN>;

printf "binary: %b\noctal: %o\ndecimal: %d\nhex: %x\n", ($number) x 4;
