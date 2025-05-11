#!/usr/bin/perl

@lines = `ls -l`;
foreach(@lines) {
  print;
}
