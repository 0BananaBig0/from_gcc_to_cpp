#!/usr/bin/perl -w
use 5.010;

my $percent = 0 if $ARGV[1] == 0 or $ARGV[0] / $ARGV[1] * 100;

say "  first  second     sum product      %";
printf "%7d %7d %7d %7d %.2f%%\n",
$ARGV[0] , $ARGV[1],
$ARGV[0] + $ARGV[1],
$ARGV[0] * $ARGV[1],
$percent;
#$ARGV[0] / $ARGV[1] * 100;
