#!/usr/bin/perl -w
use v5.10.1;

say 'Please input the first list on a single line:';
my $first = <STDIN>;
$first =~ s/^\s+//g;
my @first = split /\s+/, $first;

say 'Please input the second list on a single line:';
my $second = <STDIN>;
$second =~ s/^\s+//g;
my @second = split /\s+/, $second;

if ( @first ~~ @second ) {
    say 'The lists are the same';
}
else {
    say 'The lists are not the same';
}
