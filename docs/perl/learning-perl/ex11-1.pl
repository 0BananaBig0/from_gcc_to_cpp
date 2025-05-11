#!/usr/bin/perl -w
use strict;

use Module::CoreList;

my %modules = %{ $Module::CoreList::version{5.014} };
print join "\n", keys %modules;
