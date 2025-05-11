#!/usr/bin/perl -w
use 5.010;

say "Checking the number $ARGV[0]";

my $favorite = 77;

given ( $ARGV[0] ) {
    when ( !/\A\d+\z/ ) { say "Not a number!"; }
    my @divisors = divisors($_);

    when ( 2 ~~ @divisors ) { say "$_ is even"; continue; }
    when ( !( 2 ~~ @divisors ) ) { say "$_ is odd"; continue; }
    when ( $favorite ~~ @divisors ) {
        say "$_ is divisible by my favorite number";
        continue;
    }
    when ($favorite) {
        say "$_ is my favorite number";
        continue;
    }
    when ( @divisors ~~ [] ) { say "$_ is prime"; }
    default { say "$_ is divisible by @divisors"; }
}

sub divisors {
    my $num      = shift;
    my @divisors = ();
    foreach my $divisor ( 2 .. $num / 2 ) {
        push @divisors, $divisor unless $num % $divisor;
    }
    return @divisors;
}    ## --- end sub divisors
