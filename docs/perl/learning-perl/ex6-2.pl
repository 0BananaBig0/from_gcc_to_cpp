#!/usr/bin/perl -w
use 5.010;

my %count;

while(<STDIN>) {
  chomp;
  $count{$_} ++;
}

foreach my $key (sort keys %count) {
  say "The count of $key is $count{$key}.";
}
