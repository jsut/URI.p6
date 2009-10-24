use URI::Authority;

class URI {
    has $.scheme is rw;
    has URI::Authority $.authority is rw;
    has $.path is rw;
    has $.query is rw;
    has $.fragment is rw;
    has $!type;

    multi method new (Str $url) {
        return self.bless(*,path => $url);
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
