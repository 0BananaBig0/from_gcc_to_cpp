#!/usr/bin/perl -w
use 5.010;

say "Please input some lines, then press Ctrl+D:";
chomp(my @lines = <STDIN>);

say "1234567890" x 6;
foreach (@lines) {
  printf "%20s\n", $_;
}
