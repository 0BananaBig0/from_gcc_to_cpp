#!/usr/bin/perl -w

print "Please input first number:\n";
chomp($first = <STDIN>);

print "Please input second number:\n";
chomp($second = <STDIN>);

$result = $first * $second;
print "The arithmetic product of ${first} and ${second} is ${result}.\n";
