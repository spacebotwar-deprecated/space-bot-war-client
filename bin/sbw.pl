#!/usr/bin/perl

use strict;
use warnings;
use v5.10;

# I don't know weather this is needed or not. Seems to work with or without
# on my v5.14 box. :/
use feature 'switch';

my $task = $ARGV[0] // "";

given ($task) {
    when (/(build|test|compile|develop)/i) {
        run_command(qq{
            cd ..;
            gulp --require coffee-script $1;
        });
    }
    # TODO: make nodemon watch the src/app dir for changes to .coffee files AND
    # changes in the src/templates dir for .html files. Also, nodemon should
    # be launched from the gulp develop task. Work to be done.
    when (/server/i) {
        die;
        my $port = $ARGV[1] // 8001;
        run_command(qq{
            PORT=$port nodemon dev-server.coffee -e coffee,html;
        });
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
        server     runs the development server, can pass in the port to run on
        help       you're looking at it.

    };

    print $message;
}

sub run_command {
    my $foo = shift;
    system $foo;
}
