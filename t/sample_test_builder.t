
use Test::Builder;

my $true = 1;
my $false = '';

sub output_diag {
    my ($t, $msg) = @_;

    $t->no_diag($false);

    $t->diag($msg);

    $t->no_diag($true);

    return $false;
}

my $t = Test::Builder->new();
$t->expected_tests(1);
$t->no_diag($true);

$t->ok($false, 'This test fails');

output_diag($t, "  Failed test 'This test fails'\n");
output_diag($t, "  at t/sample_1.t line 3.\n");
output_diag($t, "Looks like you failed 1 test of 1.\n");
