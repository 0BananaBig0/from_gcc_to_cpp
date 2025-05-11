#!/usr/bin/perl -w
use strict;

sub add {
  my $sum;
  foreach (@_) {
    $sum += $_;
  }
  $sum;
}

sub multiply {
  my $product = 1;
  foreach (@_) {
    $product *= $_;
  }
  $product;
}

sub cal {
  my $op = shift;
  if ($op eq "+") {
    &add;
  }
  elsif ($op eq "*") {
    &multiply;
  }
  else {
    print "Unrecogonized operator!\n";
  }
}

print "The sum is ", cal("+", 1 .. 10), "\n";
print "The product is ", cal("*", 1 .. 10), "\n";

