#!/usr/bin/perl -w
use 5.010;

binmode STDOUT, ':crlf';

foreach (@ARGV) {
  say $_;
}
