#!/usr/bin/perl -w
use strict;

my $filename = './sample_text';
open my $fh, '<', $filename or die "Can't open $filename: $!";
chomp( my @strs = <$fh> );
while (1) {
    print 'Please input a pattern: ';
    chomp( my $pattern = <STDIN> );
    last if $pattern =~ /\A\s*\z/;
    my @matches = eval { grep /$pattern/, @strs; };

    if ($@) {
        print "Error: $@";
    }
    else {
        my $count = @matches;
        print "There were $count matching strings:\n", map "$_\n", @matches;
    }
    print "\n";
}
