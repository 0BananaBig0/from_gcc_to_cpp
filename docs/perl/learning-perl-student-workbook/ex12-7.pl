#!/usr/bin/perl -w
use strict;

use File::Basename;
use File::Find;
use Statistics::Descriptive;

my ( %file_count, %dir_count, %link_count );

sub wanted {
    my $full_path = $File::Find::name;
    my $dirname   = dirname($full_path);
    $file_count{$dirname}++ if -f $full_path;
    $dir_count{$dirname}++  if -d $full_path;
    $link_count{$dirname}++ if -l $full_path;
}    ## --- end sub wanted

find( \&wanted, @ARGV );

report_stats( 'file',      %file_count );
report_stats( 'directory', %dir_count );
report_stats( 'link',      %link_count );

sub report_stats {
    my ( $label, %hash ) = @_;

    my $stats = Statistics::Descriptive::Full->new;
    $stats->add_data( values %hash );

    printf "Average $label count: %.2f\nStandard devaition: %.2f\n\n",
        $stats->mean || 0, $stats->standard_deviation || 0;
}    ## --- end sub report_stats
