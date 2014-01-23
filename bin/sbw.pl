#!/usr/bin/perl

use strict;
use warnings;
use v5.10;

# I don't know weather this is needed or not. Seems to work with or without
# on my v5.14 box. :/
use feature 'switch';


my $task = $ARGV[0] // "";
my $commands;

given ($task) {
    when (/(build|otherGulpTask)/i) {
        $commands = qq{
            cd ..;
            gulp --require coffee-script $1;
        }; 
    }
    when (/test|t/i) {
        $commands = qq{
            echo "Testng not implemented!";
        };
    }
    when (/server/i) {
        my $port = $ARGV[1] // 8002;
        $commands = qq{
            echo "Warning: dev-server implementation still in progress!";
            cd ../dev-server
            PORT=$port nodemon dev-server.coffee
        };
    }
    when (/help/i) {
        display_help_message();
        exit;
    }
    default {
        if ($_) {
            say "FATAL ERROR: I don't know what '$_' is!";
        }
        else {
            say 'FATAL ERROR: No task provided';
        }
        exit;
    }
}

system $commands;


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

END {
    # For fun. Who cares? .... *Right?*
    say "\n";
    say 'Thanks for visiting. Do come again!';
    say "\n";
}
