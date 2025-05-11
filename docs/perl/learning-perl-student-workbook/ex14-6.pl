#!/usr/bin/perl -w
use 5.012;

my @first = qw( Fred Barney Betty Wilma Larry );
my @last  = qw( Flintstone Rubble Rubble Flintstone Slate );

while ( my ( $idx, $value ) = each @first ) {
    say "$value $last[$idx]";
}
