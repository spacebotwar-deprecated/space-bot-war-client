#!/usr/bin/perl

use strict;
use warnings;
use v5.10;

use feature 'switch';

my $task = $ARGV[0] // "";

given ($task) {
    when (/(build|test|compile)/i) {
        run_command(qq{
            gulp $1 --require coffee-script/register;
        });
    }
    when (/develop/i) {
        my $port = $ARGV[1] || 8001;
        run_command(qq{
            PORT=$port gulp develop --require coffee-script/register;
        })
    }
    when (/help/i) {
        display_help_message();
        exit;
    }
    default {
        if ($_) {
            die "I don't know what '$_' is!";
        }
        else {
            die 'No task provided';
        }
    }
}


sub display_help_message {
    my $message = qq{
    Usage: ./sbw.pl <task> <that task's options>

    Available tasks:
        build      builds the js code, basically a wrapper around 'gulp build'
        test       not implemented.
        develop    runs the development server, can pass in the port to run on
        help       you're looking at it.

    };

    print $message;
}

sub run_command {
    my $foo = shift;
    
    # Strip any whitespace or newlines off. I don't know weather it prevents
    # any errors but it makes $foo read more clearly when printed. Or something.
    $foo =~ s/  //g;
    $foo =~ s/\n//g;
    print STDERR "SYSTEM $foo\n";
    system $foo;
}
