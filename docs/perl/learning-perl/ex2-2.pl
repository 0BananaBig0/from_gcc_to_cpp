#!/usr/bin/perl -w

$pi = 3.141592654;

print "What is the radius?\n";
chomp($radius = <STDIN>);

$circum = 2 * $pi * $radius;
print "The circumference of a circle with radius ${radius} is ${circum}.\n";
