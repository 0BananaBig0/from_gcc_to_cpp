#!/usr/bin/perl -w

print "Please input first number:\n";

while ($num = <STDIN>) {
  chomp($num);
  $sum += $num;
  print "Please input another number:\n";
}

print "The sum of numbers is: ${sum}.\n";
