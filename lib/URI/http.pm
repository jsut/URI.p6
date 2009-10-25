use URI;
use URI::Authority;

class URI::http is URI {
    has URI::Authority $.authority is rw;
    has $.path is rw;
    has $.query is rw;
    has $.fragment is rw;

    multi method new (Str $uri) {
        my %h = %.parse_uri($uri);
        return self.bless(*, |%h);
    }

    multi method new (:$scheme, URI::Authority :$authority, :$path, :$query, :$fragment) {
        return self.bless(*,:$scheme,:$authority,:$path,:$query,:$fragment);
    }

    multi method new (:$scheme, :$authority, :$path, :$query, :$fragment) {
        return self.bless(*,
            :$scheme,
            authority => URI::Authority.new(:$authority),
            :$path,
            :$query,
            :$fragment,
        )
    }

}
