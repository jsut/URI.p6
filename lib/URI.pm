class URI {
    has $.scheme is rw;
    has $.opaque is rw;
    has $.fragment is rw;

    #
    # multi method constructors!
    #
    # this one is what get's called if you just pass in a string like:
    # URI.new('mailto:lol@haha.com') 
    #
    multi method new (Str $uri) {
        my %h = self.parse_uri($uri);
        #
        # at this point it would make sense to look to see if there is a
        # subclass of URI that implements this scheme (by looking for
        # URI::<scheme>), and then making one of them, instead of a generic
        # URI object
        #
        return self.bless(*,|%h);
    }

    #
    # this one gets called if you pass in a hash.
    #
    multi method new (:$scheme, :$opaque, :$fragment) {
        return self.bless(*,:$scheme,:$opaque,:$fragment);
    }

    #
    # this assumes that the uri is properly encoded (among other things)
    #
    method parse_uri (Str $uri) {
        my ($scheme,@rest) = $uri.split(':');
        my @parts = @rest.join(':').split('#');
        my $opaque = shift @parts;
        my $fragment = @parts.join('#');
        return (
            scheme   => $scheme,
            opaque   => $opaque,
            fragment => $fragment,
        );
    }

}
