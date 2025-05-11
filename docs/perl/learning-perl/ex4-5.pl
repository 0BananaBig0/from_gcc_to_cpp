#!/usr/bin/perl -w
use 5.010;

sub greet {
  state @persons;

  my $name = shift;

  print "Hi $name! ";
  if (@persons > 0) {
    print "I've seen @persons.\n";
  }
  else {
    print "You are the first one here!\n";
  }
  push @persons, $name
}

greet("Fred");
greet("Barney");
greet("Wilma");
greet("Betty");
