class URI::Authority {
    has $.userinfo;
    has $.host;
    has $.port;

    multi method new($self: Str $lol ) {
        say 'in string new';
        $self.bless(*, host => $lol);
    }

    multi method new($self: Str :$host, Str :$userinfo, Str :$port) {
        say 'in hash new';
        $self.bless(*, host => $host, userinfo => $userinfo, port => $port );
    }

    submethod BUILD (Str :$host) {
        say 'in URI::A BUILD';
        $!host = $host;
    }

}

