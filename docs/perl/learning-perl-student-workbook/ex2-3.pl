#!/usr/bin/perl -w

print "Please input a number:\n";
chomp($num = <STDIN>);

$result = $num & 1 ? "odd" : "even";
print "The number ${num} is ${result}.\n";
