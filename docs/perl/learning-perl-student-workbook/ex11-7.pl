#!/usr/bin/perl -w
use strict;

use XML::Twig;

my $twig = XML::Twig->new;
$twig->parsefile('ex11-7.xml');
my $root = $twig->root;

foreach my $char ( $root->children('character') ) {
    $char->cut_children('score');
}
$twig->print( pretty_print => 'indented' );
