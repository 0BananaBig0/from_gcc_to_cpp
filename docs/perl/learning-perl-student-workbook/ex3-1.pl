#!/usr/bin/perl -w

print "Please input some lines, then press Ctrl+D\n";
@lines = <STDIN>;

if($#lines > 0) {
  print "The second-to-last line is: $lines[-2]";
}
else {
  print "There aren't enough lines for a second-to-last one.\n";
}
