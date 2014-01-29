#!/usr/bin/perl

=head2

    NOTE:   this is a temp script while getting the client to use.
            the next step here is to use a GulpJS task.

=cut

use strict;
use warnings;
use v5.10;

use File::Find;
use Data::Dumper;

use File::Spec;

use autodie qw(system);

my $compiled_count = 0;
find(\&wanted, './');

sub wanted {
    if (is_coffeescript($_)) {
        say 'Compiling ' . File::Spec->catfile($File::Find::dir, $_);
        system "coffee -mc $_";
        $compiled_count++;
    }
}

sub is_coffeescript {
    my $file_name = shift;
    return ($file_name =~ m/coffee$/i);
}

END {
    say '';
    say 'We did it!';
    say 'Compiled ' . $compiled_count . ' file(s)!';
    say '';
}
