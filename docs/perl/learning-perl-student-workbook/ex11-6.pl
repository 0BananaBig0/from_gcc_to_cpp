#!/usr/bin/perl -w
use strict;

use DBI;

my $dbh = DBI->connect( 'dbi:SQLite:dbname=flintstones.db', '', '' );

$dbh->do( '
    CREATE TABLE IF NOT EXISTS Characters (
        id    integer,
        first text,
        last  text
    )'
);

my %characters = qw(
    Fred   Flintstone
    Wilma  Flintstone
    Betty  Rubble
    Barney Rubble
    Larry  Slate
);

my $sth = $dbh->prepare('INSERT INTO Characters VALUES (?,?,?)');
my $idx = 0;

foreach my $first_name ( keys %characters ) {
    $sth->execute( $idx++, $first_name, $characters{$first_name} );
}
