#!/usr/bin/perl -w
use 5.010;


push @ARGV, '-';

foreach my $file (@ARGV) {
  #open my($fh), "<", $file; # wrong! can't open '-', no such file!
  open my($fh), "< $file"; # In the two-argument (and one-argument) form, opening <- or - opens STDIN and opening >- opens STDOUT. (perldoc open)
  $file = 'stdin' if $file eq '-';
  while(<$fh>) {
    print "$file: $_";
  }
  close $fh;
}
