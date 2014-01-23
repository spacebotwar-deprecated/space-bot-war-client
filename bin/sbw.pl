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
    when (m/(build|otherTask)/i) {
        $commands = qq{
            cd ..;
            gulp --require coffee-script $1;
        }; 
    }
    when (m/test|runtests|t/i) {
        $commands = qq{
            echo "Testng not implemented!";
        };
    }
    when (m/runserver|server|dev-server/i) {
        $commands = qq{
            echo "Warning: dev-server implementation still in progress!";
            cd ../dev-server
            PORT=8003 nodemon dev-server.js
        };
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

END {
    # For fun. Who cares? .... *Right?*
    say '';
    say 'Thanks for visiting. Do come again!';
    say '';
}
