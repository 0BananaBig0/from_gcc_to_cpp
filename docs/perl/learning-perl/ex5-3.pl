#!/usr/bin/perl -w
use 5.010;

say "Please input the column width:";
chomp(my $width = <STDIN>);

say "Please input some lines, then press Ctrl+D:";
chomp(my @lines = <STDIN>);

say "1234567890" x (($width+9)/10);
foreach (@lines) {
  printf "%${width}s\n", $_;
}
