class URI::Authority {
    has $.userinfo;
    has $.host;
    has $.port;

    multi method new(Str $authority) {
        self.bless(*, host => $authority);
    }

    multi method new(:$host, :$userinfo, :$port) {
        self.bless(*, :$host, :$userinfo, :$port );
    }

}

