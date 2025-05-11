#!/usr/bin/perl -w

print "Please input a string:\n";
$str = <STDIN>;

print "Please input a number:\n";
chomp($num = <STDIN>);

$result = $str x $num;
print "The result is:\n${result}";
