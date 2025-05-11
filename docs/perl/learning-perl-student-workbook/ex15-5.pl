#!/usr/bin/perl -w
use v5.10.1;

my $secret = 'Barney';

LOOP: while ( defined( my $line = <STDIN> ) ) {
    chomp($line);

    given ($secret) {
        when ( $line eq 'give up' ) {
            say 'Too hard? Better luck next time';
            last LOOP;
        }
        when ($line) { say 'You guessed the secret word!'; last LOOP; }
        when (/$line/) {
            say "The secret word matches the pattern [$line]";
            print "\nEnter another string or pattern> ";
        }
        default {
            say "[$line] didn't help at all";
            print "\nEnter another string or pattern> ";
        }
    }
}
