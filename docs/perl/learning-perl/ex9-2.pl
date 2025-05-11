#!/usr/bin/perl -w
use strict;

my $in = $ARGV[0];
if (! defined $in) {
  die "Usage: $0 filename";
}

my $out = $in =~ s/(\.\w+)?$/.out/r;
my $in_fh;
my $out_fh;

if (! open $in_fh, '<', $in ) {
  die "Can't open '$in': $!";
}

if (! open $out_fh, '<', $out ) {
  die "Can't open '$out': $!";
}

while (<$in_fh>) {
  s/Fred/Larry/gi;
  print $out_fh $_;
}
