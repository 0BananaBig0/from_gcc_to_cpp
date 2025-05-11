#!/usr/bin/perl -w
use 5.010;

my $Debug = $ENV{DEBUG} // 1;

my $secret = int( 1 + rand 100 );
print "The secret is $secret.\n" if $Debug;

while (1) {
    print "Please input a guess from 1 to 100: ";
    chomp( my $guess = <STDIN> );

    my $found_it = 0;

    given ($guess) {
        when ( !/\A\d+\z/ )   { say "Not a number!"; }
        when ( $_ > $secret ) { say "Too large!"; }
        when ( $_ < $secret ) { say "Too small!"; }
        default { say "You got it!"; $found_it++; }
    }
    last if $found_it;
}
