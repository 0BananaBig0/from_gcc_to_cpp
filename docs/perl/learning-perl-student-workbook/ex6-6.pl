#!/usr/bin/perl -w
use 5.010;

my %birthday = (
  Fred => 'April 5',
  Wilma => 'October 26',
  Pebbles => 'October 8',
  Alice => undef,
  Bob => '',
);

while (my ($name, $birth) = each %birthday) {
  if ($birthday{$name}) {
    say "${name}'s birthday is $birth.";
  }
}
