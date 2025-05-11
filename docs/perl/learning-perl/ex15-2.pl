#!/usr/bin/perl -w
use 5.010;

for ( 1 ... 105 ) {
    my $result = '';
    given ($_) {
        when ( not $_ % 3 ) { $result .= ' Fizz'; continue; }
        when ( not $_ % 5 ) { $result .= ' Buzz'; continue; }
        when ( not $_ % 7 ) { $result .= ' Sausage'; }
    }
    say "$_$result";
}
