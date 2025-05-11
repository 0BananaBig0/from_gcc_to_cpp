#!/usr/bin/perl -w
use 5.010;

my $log = 'ex5-10.log';
open my($fh), '>>', $log or die "Could not open $log! $!";

say "Please input a message:";
my $message = <STDIN>;
my $timestamp = localtime;
print $fh "[$timestamp] $message";
