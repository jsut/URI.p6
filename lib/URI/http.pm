use URI;
use URI::Authority;

#
# for http type urls
#

class URI::http is URI {
    has URI::Authority $.authority is rw;
    has $.path is rw;
    has $.query is rw;
    has $.fragment is rw;

    #
    # i'm not really sure why this constructor has to be here, i would expect
    # that it should be inherited from URI, and i'd think that it should just
    # work, but if i take this out, i get:
    #
    #     too many arguments passed (2) - 1 param expected
    #     in Main (file src/gen_setting.pm, line 295)
    #
    multi method new (Str $uri) {
        my %h = self.parse_uri($uri);
        return self.bless(*, |%h);
    }

    #
    # all strings, but an actually URI::Authority object.
    #
    multi method new (:$scheme, URI::Authority :$authority, :$path, :$query, :$fragment) {
        return self.bless(*,:$scheme,:$authority,:$path,:$query,:$fragment);
    }

    #
    # if you pass in a string for the authority, we turn it into an URI::Authority
    # object
    #
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
