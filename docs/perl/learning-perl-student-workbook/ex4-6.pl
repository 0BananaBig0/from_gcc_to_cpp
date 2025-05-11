#!/usr/bin/perl -w
use strict;

sub separate {
  if (@_ == 1) {
    "@_";
  }
  elsif (@_ == 2) {
    "$_[0] and $_[1]";
  }
  elsif (@_ > 2) {
    my $last_item = pop;
    local $" = ", ";
    "@_, and $last_item";
  }
}

print separate(qw( fred )), "\n";
print separate(qw( fred barney )), "\n";
print separate(qw( fred barney betty )), "\n";
print separate(qw( fred barney betty wilma )), "\n";
