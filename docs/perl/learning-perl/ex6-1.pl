#!/usr/bin/perl -w
use 5.010;

my %last_name = (
  fred => 'flintstone',
  barney => 'rubble',
  wilma => 'flintstone',
);
say "Please input a first name:";
chomp(my $first_name = <STDIN>);
say "The last name of $first_name is $last_name{$first_name}.";
