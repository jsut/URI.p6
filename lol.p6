#!/opt/rakudo/perl6

use lib qw(lib);

use URI;
use URI::Authority;

my $uri = URI::Authority.new('haha');
say 'hi';
say '-' ~ $uri.host ~ '-';
say 'there';

my $uri2 = URI::Authority.new(host => 'hasher');
say 'hi';
say '-' ~ $uri2.host ~ '-';
say 'there';

my $uri3 = URI.new(authority => 'lols');
say 'hi';
say '-' ~ $uri3.authority~ '-';
say 'there';

my $uri4 = URI.new(authority => $uri2);
say 'hi';
say '-' ~ $uri2 ~ '-';
say '-' ~ $uri4.authority~ '-';
say 'there';
