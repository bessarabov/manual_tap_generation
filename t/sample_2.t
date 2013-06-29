$| = 1;

print "1..1\n";
print "not ok 1 - This test fails\n";
print STDERR "#   Failed test 'This test fails'\n";
print STDERR "#   at t/sample_1.t line 3.\n";
print STDERR "# Looks like you failed 1 test of 1.\n";

exit 1;
