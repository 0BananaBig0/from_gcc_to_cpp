#!/usr/bin/perl -w
use strict;

my @names  = qw(Fred Barney Dino);
my @scores = qw(230 190 30);

my %scores;
@scores{@names} = @scores;

foreach my $name ( sort keys %scores ) {
    print "$name has score $scores{$name}\n";
}
