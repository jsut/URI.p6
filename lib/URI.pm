class URI {
    has $.scheme is rw;
    has $.opaque is rw;
    has $.fragment is rw;

    multi method new (Str $uri) {
        my %h = %.parse_uri($uri);
        #
        # at this point it would make sense to look to see if there is a
        # subclass of URI that implements this scheme (by looking for
        # URI::<scheme>, and then making one of them, instead of a generic
        # URI object
        #
        return self.bless(*,|%h);
    }

    multi method new (:$scheme, :$opaque, :$fragment) {
        return self.bless(*,:$scheme,:$opaque,:$fragment);
    }

    method parse_uri (Str $uri) {
        my ($scheme,@rest) = $uri.split(':');
        say $scheme;
        return (
            scheme => $scheme,
        );
    }

}
