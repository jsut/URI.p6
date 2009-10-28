use v6;
use Test;

plan 26;

use URI;
ok(1,q[URI.pm actually loads!]);

{
    my $uri = URI.new();
    is($uri.scheme, undef,q[scheme is undefined]);
    is($uri.authority, undef,q[query is undefined]);
    is($uri.path, undef,q[query is undefined]);
    is($uri.query, undef,q[query is undefined]);
    is($uri.fragment, undef,q[fragment is undefined]);
}
{
    my $uri = URI.new(
        scheme => 'http',
        authority => 'what.com',
        path => '/lolol/',
        query => 'lols=haha',
        fragment => 'haha',
    );
    is($uri.scheme, q[http], q[scheme is http]);
    is($uri.authority, q[what.com], q[authority is what.com]);
    is($uri.path, q[/lolol/], q[query is /lolol/]);
    is($uri.query, q[lols=haha], q[query is lols=haha]);
    is($uri.fragment, q[haha], q[fragment is haha]);
}
{
    my $uri = URI.new('http://somedomain.com/path/to/file/?a=b&a=c&d=d#top');
    is($uri.scheme, 'http', 'String constructor parses scheme correctly');
    is($uri.authority, 'somedomain.com', 'String constructor parses authority correctly');
    is($uri.path, '/path/to/file/', 'String constructor parses path correctly');
    is($uri.query, 'a=b&a=c&d=d','String constructor parses query correctly');
    is($uri.fragment, 'top', 'String constructor parses fragment correctly');
}
{
    my $uri = URI.new('mailto:lol@haha.com?subject=ur+silly');
    is($uri.scheme, 'mailto', 'String constructor parses scheme correctly');
    is($uri.authority, undef, 'String constructor parses scheme correctly');
    is($uri.path, 'lol@haha.com', 'String constructor parses path correctly');
    is($uri.query, 'subject=ur+silly','String constructor parses query correctly');
    is($uri.fragment, undef, 'String constructor parses fragment correctly');
}
{
    my $uri = URI.new('urn:example:animal:ferret:nose');
    is($uri.scheme, 'urn', 'String constructor parses scheme correctly');
    is($uri.authority, undef, 'String constructor parses scheme correctly');
    is($uri.path, 'example:animal:ferret:nose', 'String constructor parses path correctly');
    is($uri.query, undef, 'String constructor parses query correctly');
    is($uri.fragment, undef, 'String constructor parses fragment correctly');
}



