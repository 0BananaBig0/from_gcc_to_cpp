#!/usr/bin/perl -w
use strict;

if ( `date` =~ /\A(Sat|Sun)/ ) {
    print "go play!\n";
}
else {
    print "get to work!\n";
}
