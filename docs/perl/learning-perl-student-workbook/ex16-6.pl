#!/usr/bin/perl -w
use strict;

open my $ls, '-|', 'ls', '-l';

my ( %users, %groups );

while (<$ls>) {
    next if /^total/;

    my ( $perm, $n, $user, $group ) = split;

    $users{$user}++;
    $groups{$group}++;
}

foreach my $user ( sort keys %users ) {
    printf "%-8s %3d\n", $user, $users{$user};
}

foreach my $group ( sort keys %groups ) {
    printf "%-8s %3d\n", $group, $groups{$group};
}
