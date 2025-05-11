#!/usr/bin/perl -w
use 5.010;

my %birthday = (
  Fred => 'April 5',
  Wilma => 'October 26',
  Pebbles => 'October 8',
);

foreach my $name (keys %birthday) {
  say "${name}'s birthday is $birthday{$name}.";
}
