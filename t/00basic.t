use v6;
use Test;

plan 8;

use URI;
ok(1,q[URI.pm actually loads!]);

{
    my $uri = URI.new();
    is($uri.scheme, undef,q[scheme is undefined]);
    is($uri.opaque, undef,q[query is undefined]);
    is($uri.fragment, undef,q[fragment is undefined]);
}
{
    my $uri = URI.new(
        scheme => 'http',
        opaque => 'lols=haha',
        fragment => 'haha',
    );
    is($uri.scheme, q[http], q[scheme is http]);
    is($uri.opaque, q[lols=haha], q[query is lols=haha]);
    is($uri.fragment, q[haha], q[fragment is haha]);
}
{
    my $uri = URI.new('http://somedomain.com/path/to/file/?a=b&a=c&d=d#top');
    is($uri.scheme, 'http', 'String constructor parses scheme correctly');
}
