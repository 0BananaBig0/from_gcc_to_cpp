#!/usr/bin/perl -w
use strict;

printf "Name%40sSize  R W E\n";
printf "----%s-----------\n", '-' x 40;

while ( my $file = glob('.* *') ) {
    next if $file =~ /^\.{1,2}$/;
    printf "%-37s %10d  %1s %1s %1s\n", $file, -s $file,
        -r $file ? 'x' : '', -w $file ? 'x' : '', -x $file ? 'x' : '';
}
