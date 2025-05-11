#!/usr/bin/perl -w
use 5.010;

foreach my $file (@ARGV) {
  my $count = count_lines($file);
  if (defined $count) {
    say "There are $count lines in $file";
  }
}

sub count_lines {
  my $file = shift;
  my $count = 0;

  if (open my ($fh), '<', $file) {
    while(<$fh>) {
      $count ++;
    }
    $count;
  }
  else {
    warn "Could not open file! $!";
    return; # without return, the retval will be 1(the retval of warn before)
  }
}
