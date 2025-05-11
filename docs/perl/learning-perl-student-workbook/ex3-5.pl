#!/usr/bin/perl -w

@numbers = ( 1 .. 10 );

while( $_ = shift @numbers ) {
  print "$_ ", $_ ** 2, " ", $_ ** 3, "\n";
}  
