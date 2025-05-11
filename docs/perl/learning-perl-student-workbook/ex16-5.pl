#!/usr/bin/perl -w
use strict;

$ENV{PATH} = '';
$ENV{TZ}   = 'US/Pacific';

exec '/bin/date';
