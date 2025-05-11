#!/usr/bin/perl -w

@names = qw/ fred betty barney dino wilma pebbles bamm-bamm /;

print "Please input some numbers from 1 to 7, one per line, then press Ctrl+D\n";
chomp(@numbers = <STDIN>);

foreach (@numbers) {
  print "$names[$_-1]\n";
}
