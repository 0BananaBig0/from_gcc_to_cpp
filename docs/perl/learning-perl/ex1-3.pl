#!/usr/bin/perl

# use regex to get contents in angle brackets(<>), then change them to uppercase
@lines = `perldoc -u -f atan2`;
foreach (@lines) {
  s/\w<([^>]+)>/\U$1/g;
  print;
}
