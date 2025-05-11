#!/usr/bin/perl -w
use strict;

use DateTime;
use Time::Piece;

my $t = localtime;

my $now = DateTime->new(
    year  => $t->year,
    month => $t->mon,
    day   => $t->mday,
);

my $input = DateTime->new(
    year  => $ARGV[0],
    month => $ARGV[1],
    day   => $ARGV[2],
);

if ( $now < $input ) {
    die "You entered a date in the future.\n";
}
my $duration = $now - $input;
my @units    = $duration->in_units(qw(years months days));
printf "%d years, %d months, and %d days\n", @units;
