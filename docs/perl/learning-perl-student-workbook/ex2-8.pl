#!/usr/bin/perl -w

print "Please input some code point:\n";

while ($code_point = <STDIN>) {
  chomp($code_point);
  print "The character of ${code_point} is ", chr(hex($code_point)), "\n";

  print "Please input some code point:\n";
}
