#!/usr/bin/perl -w
use strict;

chomp( my $header = <> );
my @field_names = split /\t/, $header;

while (<>) {
  chomp;
  my @fields = split /\t/;

  foreach my $index ( 0 .. $#fields ) {
    print "$field_names[$index]: $fields[$index]\n";
  }
}
