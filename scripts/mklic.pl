#! /usr/bin/perl

use warnings;
use strict;
use Carp;

sub spitout($$) {
  my ($var,$file)=@_;
  
  my $ret;
  

  open(IN, $file) or croak;
  my $l = join("", <IN>);
  $l =~ s/\r//g;
  $l =~ s/\n/\\n/g;
  $l =~ s/\"/\\\"/g;

  return qq!static const char *${var} = \"! . $l . "\";\n\n\n";
}

open(F, "> ../licenses.h");

print F spitout("licenseMumble", "../LICENSE");

close(F);
