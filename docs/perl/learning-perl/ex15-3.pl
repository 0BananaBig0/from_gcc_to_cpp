#!/usr/bin/perl -w
use 5.010;

for (@ARGV) {
    say "Processing $_";

    when ( !-e ) { say "\tFile does not exists!"; }
    when ( -r _ ) { say "\tReadable!";  continue; }
    when ( -w _ ) { say "\tWritable!";   continue; }
    when ( -x _ ) { say "\tExecutable!"; continue; }
}
