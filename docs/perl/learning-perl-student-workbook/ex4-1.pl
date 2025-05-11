#!/usr/bin/perl -w
use strict;

sub show_args {
  print "The arguments are @_\n";
}

show_args( 'fred', 'barney', 'betty' );
