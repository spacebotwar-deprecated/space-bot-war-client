#!/usr/bin/perl

=head1


        One Script to rule them all, One Script to find them,
        One Script to bring them all and in the darkness bind them,


=cut

use strict;
use warnings;
use v5.10;

STDOUT->autoflush;

use feature 'switch';

use File::Path qw(remove_tree);
use File::Find::Rule;
use File::Spec::Functions qw(catfile);
use Cwd;

use autodie ':all';

my $dir = getcwd;

my $task = $ARGV[0] // "";
run_task($task);

sub run_task {
    my $task = shift;

    say '';
    say "############### $task ###############";
    say '';

    given ($task) {
        when (/fresh_build/i) {
            run_task('clean');
            run_task('update');
            run_task('build');
        }
        when (/build/i) {
            run_task('compile');
            run_command(qq{
                cd build;
                ./build.sh;
            });
        }
        when (/compile/i) {
            run_command(qq{
                gulp compile --require coffee-script/register;
            });
        }
        when (/develop/i) {
            my $port = $ARGV[1] || 8001;
            run_command(qq{
                PORT=$port gulp develop --require coffee-script/register;
            })
        }
        when (/test/i) {
            # TODO: use something like Browser::Open to open
            # localhost:8001/test.html
        }
        when (/clean/i) {
            # Keep track of the number of files deleted.
            my $delete_count = 0;

            my @to_search = (
                catfile($dir, 'src', 'js-libs'),
                catfile($dir, 'node_modules'),
            );

            my @to_delete = File::Find::Rule->new
                ->directory
                ->maxdepth(1)
                ->in(@to_search);

            my @foo = File::Find::Rule->new
                ->file
                ->name('*.js', '*.map')
                ->in(catfile($dir, 'src', 'app'));

            @to_delete = (@to_delete, @foo);

            # For some reason, these make it into the search.
            @to_delete = grep {not m/node_modules$|js\-libs$/i} @to_delete;

            # Break out if there's nothing to delete.
            return if (not scalar @to_delete);

            my $to_delete_pretty = join ",\n", @to_delete;
            say qq{
WARNING: The following directories and their contents are about to be deleted!
You have a brief moment to cancel the script.

$to_delete_pretty
            };

            for (reverse 1..5) {
                print "$_.. ";
                sleep 1;
            }

            say 'Deleting files';
            $delete_count += remove_tree(@to_delete);

            # Cull the build as well, in case that messes up.
            push @to_delete, catfile($dir, 'public', 'dist', 'build.js');

            say "Successfully deleted $delete_count files";
        }
        when (/update/i) {
            run_command(qq{
                npm install;
                bower update;
            });
        }
        when (/setup/i) {
            say 'Please ensure you have NodeJS and npm installed.';
            run_command(qq{
                # Make sure we have latest npm
                sudo npm update npm -g;
                sudo npm install gulp -g;
                sudo npm install bower -g;
            });
            # Make sure there's no evil things here, just in case.
            run_task('clean');
            run_task('update');
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
}


sub display_help_message {
    # TODO: open the link with Browser::Open

    my $message = qq{
    Please see the following link for usage and information about how all this
    works. 

    https://github.com/spacebotwar/space-bot-war-client/wiki/sbw.pl-Help
};

    print $message;
}

sub run_command {
    my $foo = shift;
    
    # Strip any whitespace or newlines off. I don't know weather it prevents
    # any errors but it makes $foo read more clearly when printed. Or something.
    $foo =~ s/  //g;
    $foo =~ s/\n//g;
    # say $foo;
    system $foo;
}
