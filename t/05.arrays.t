use Test::More;
use Test::Differences;

use Config::Tiny;

use strict;
use warnings;

my $in = q{
foo[]=bar
foo[]=baz
[bar]
baz[]=quux
baz[]=foo};
my $out = bless {
  '_' => {
    foo => [qw(bar baz)],
  },
  bar => {
    baz => [qw(quux foo)],
  },
}, 'Config::Tiny';

my $read = Config::Tiny->read_string($in);
eq_or_diff($read,$out);

done_testing;