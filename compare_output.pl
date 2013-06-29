#!/usr/bin/perl

use strict;
use warnings FATAL => 'all';

use Capture::Tiny ':all';
use Test::More qw(no_plan);
use Test::Differences;

my $h;

foreach my $number (1..2) {

    my ($stdout, $stderr, $exit) = capture {
        system( "perl t/sample_$number.t");
    };

    $h->{$number}->{stdout} = $stdout;
    $h->{$number}->{stderr} = $stderr;
    $h->{$number}->{exit} = $exit;

}

eq_or_diff(
    $h->{2}->{stdout},
    $h->{1}->{stdout},
    'stdout',
);

eq_or_diff(
    $h->{2}->{stderr},
    $h->{1}->{stderr},
    'stderr',
);

is(
    $h->{2}->{exit},
    $h->{1}->{exit},
    'stderr',
);
