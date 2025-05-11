#!/usr/bin/perl -w
use strict;

my ( %users, %groups );
foreach (`ls -l`) {
    next if /^total/;

    my ( undef, undef, $user, $group ) = split;

    $users{$user}++;
    $groups{$group}++;
}

foreach my $user ( sort keys %users ) {
    printf "%-8s %3d\n", $user, $users{$user};
}

foreach my $group ( sort keys %groups ) {
    printf "%-8s %3d\n", $group, $groups{$group};
}
