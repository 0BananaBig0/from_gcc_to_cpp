#!/usr/bin/perl -w

# non-digit will be treated as 0
print "Please input first number:\n";
chomp($first = <STDIN>);

print "Please input second number:\n";
chomp($second = <STDIN>);

if ($first > $second) {
  print "${first} is larger than ${second}.\n";
}
elsif ($first < $second) {
  print "${first} is smaller than ${second}.\n";
}
else {
  print "${first} and ${second} are equal.\n";
}
