#!/usr/bin/perl -w
use 5.010;

my %birthday = (
  Fred => 'April 5',
  Wilma => 'October 26',
  Pebbles => 'October 8',
  Alice => undef,
  Bob => '',
);

say "Please input a name:";
chomp(my $name = <STDIN>);

if ($birthday{$name}) {
  say "The birthday of $name is $birthday{$name}.";
}
elsif (exists $birthday{$name}) {
  say "$name is in the birthday hash, but I don't know the birthday.";
}
else {
  say "$name is not in the birthday hash.";
}
