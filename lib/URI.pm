use URI::Authority;

class URI {
    has $.scheme is rw;
    has $.authority is rw;
    has $.path is rw;
    has $.query is rw;
    has $.fragment is rw;
    has $!type;

    method as_string($self:) {
        return $self.scheme;
    }

}
