#!/usr/bin/perl -w
use 5.010;

sub my_hup_handler {
    state $n;
    say 'Caught HUP: ', ++$n;
}    ## --- end sub my_hup_handler

sub my_usr1_handler {
    state $n;
    say 'Caught USR1: ', ++$n;
}    ## --- end sub my_usr1_handler

sub my_usr2_handler {
    state $n;
    say 'Caught USR2: ', ++$n;
}    ## --- end sub my_usr2_handler

sub my_int_handler {
    say 'Caught INT. Exiting... ';
    exit;
}    ## --- end sub my_int_handler

say "I am $$";

foreach my $signal (qw(hup usr1 usr2 int)) {
    $SIG{ uc $signal } = "my_${signal}_handler";
}

while (1) { sleep 1; }
