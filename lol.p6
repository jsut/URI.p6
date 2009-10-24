#!/opt/rakudo/perl6

use lib qw(lib);

use URI;
use URI::Authority;

my $uri = URI::Authority.new('haha');
say '-' ~ $uri.host ~ '-';
say '';

my $uri2 = URI::Authority.new(host => 'hasher');
say '-' ~ $uri2.host ~ '-';
say '';

my $uri3 = URI.new(authority => 'lols');
say '-' ~ $uri3.authority~ '-';
say '';

my $uri4 = URI.new(authority => $uri2);
say '-' ~ $uri2 ~ '-';
say '-' ~ $uri4.authority~ '-';
say '';

say $uri4.authority.isa('URI\:\:Authority');
say $uri4.isa('URI');
