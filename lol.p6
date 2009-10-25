#!/opt/rakudo/perl6

use lib qw(lib);

use URI;
use URI::Authority;



my $uri = URI.new('http://www.haha.com');
say '-' ~ $uri ~ '-';
say '-' ~ $uri.scheme ~ '-';
say '';

