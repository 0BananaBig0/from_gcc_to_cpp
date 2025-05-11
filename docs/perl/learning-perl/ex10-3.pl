#!/usr/bin/perl -w
use 5.010;

$ENV{UNDEFINED} = undef;

my $longest = 0;
foreach my $key ( keys %ENV ) {
    my $key_len = length $key;
    $longest = $key_len if $key_len > $longest;
}

foreach my $key ( sort keys %ENV ) {
    printf "%${longest}s %s\n", $key, $ENV{$key} // "(undefined)";
}
