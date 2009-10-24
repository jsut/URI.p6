use v6;
use Test;

plan 11;

use URI;

ok(1,q[URI.pm actually loads!]);

my $uri = URI.new();

is($uri.scheme, undef,q[scheme is undefined]);
is($uri.authority, undef,q[authority is undefined]);
is($uri.path, undef,q[path is undefined]);
is($uri.query, undef,q[query is undefined]);
is($uri.fragment, undef,q[fragment is undefined]);

my $uri2 = URI.new(
    scheme => 'http',
    authority => 'localhost',
    path => '/',
);

is($uri2.scheme, q[http],q[scheme is http]);
isa_ok($uri2.authority, URI::Authority,q[authority is localhost]);
is($uri2.path, q[/],q[path is undefined]);
is($uri2.query, undef,q[query is undefined]);
is($uri2.fragment, undef,q[fragment is undefined]);
