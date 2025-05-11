#!/usr/bin/perl -w

print "Please input some lines, then press Ctrl+D\n";

$last_line = <STDIN>;
while( defined( $new_line = <STDIN> ) ) {
  ($second_to_last_line, $last_line) = ($last_line, $new_line);
}

if( defined( $second_to_last_line ) ) {
  print "The second-to-last line is $second_to_last_line";
}
else {
  print "There aren't enough lines for a second-to-last one.\n";
}
