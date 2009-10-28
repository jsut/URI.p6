class URI {
    has $.scheme is rw;
    has $.authority is rw;
    has $.path is rw;
    has $.query is rw;
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
    multi method new (:$scheme, :$authority, :$path, :$query, :$fragment) {
        return self.bless(*,:$scheme,:$authority,:$path,:$query,:$fragment);
    }

    #
    # this assumes that the uri is properly encoded (among other things)
    #
    method parse_uri (Str $uri) {
        my %parsed;
        my @bits = $uri.split(':');
        %parsed{'scheme'} = shift @bits;
        my @parts = @bits.join(':').split('#');
        my $opaque = shift @parts;
        %parsed{'fragment'} = @parts.join('#');
        my (@stuff) = $opaque.split('?');
        $opaque = shift @stuff;
        %parsed{'query'} = @stuff.join('?');

        if ($opaque.substr(0,2) eq '//') {
            $opaque = $opaque.substr(2);
            my ($auth,@path) = $opaque.split('/');
            %parsed{'authority'} = $auth;
            if (@path) {
                %parsed{'path'} = '/' ~ @path.join('/');
            }
        }
        else {
            %parsed{'path'} = $opaque;
        }
        return %parsed;
    }

}
