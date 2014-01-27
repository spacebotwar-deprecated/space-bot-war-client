#!/usr/bin/perl

use strict;
use warnings;
use v5.10;

use File::Find;
use Data::Dumper;

# TODO: cpanm IPC::System::Simple
use autodie qw(system);

find(\&wanted, './');

my $compiled_count = 0;

sub wanted {
    if (is_coffeescript($_)) {
        print "Compiling $_";
        system "coffee -mc $_";
        $compiled_count++;
    }
}

sub is_coffeescript {
    my $file_name = shift;
    return ($file_name =~ m/coffee$/i);
}

END {
    say "We did it!";
    say "Compiled $compiled_count file(s)!";
}
