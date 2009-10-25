use v6;
use Test;

plan 12;

use URI::http;
use URI::Authority;

ok(1,q[Stuff actually loads!]);

{
    my $uri = URI::http.new();
    is($uri.scheme, undef,q[scheme is undefined]);
    is($uri.authority, undef,q[authority is undefined]);
    is($uri.path, undef,q[path is undefined]);
    is($uri.query, undef,q[query is undefined]);
    is($uri.fragment, undef,q[fragment is undefined]);
}
{
    my $uri = URI::http.new(
        scheme => 'http',
        authority => 'localhost',
        path => '/',
        query => 'lols=haha',
        fragment => 'haha',
    );
    is($uri.scheme, q[http], q[scheme is http]);
    isa_ok($uri.authority, URI::Authority, q[authority is an URI::Authority object]);
    is($uri.path, q[/], q[path is /]); #/
    is($uri.query, q[lols=haha], q[query is lols=haha]);
    is($uri.fragment, q[haha], q[fragment is haha]);
}
{
    my $uri = URI::http.new('http://somedomain.com/path/to/file/?a=b&a=c&d=d#top');
    is($uri.scheme, 'http', 'String constructor parses scheme correctly');
}
