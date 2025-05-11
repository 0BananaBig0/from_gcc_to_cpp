#!/usr/bin/perl -w

print "Please input some lines, then press Ctrl+D\n";
chomp(@strs = <STDIN>);
@sorted = sort @strs;

print "All in one line:\n";
print "@sorted\n";

print "One per line:\n";
foreach $str (@sorted) {
  print "$str\n";
}
