package MyApp::Controller::Root;
use strict;
use warnings;

sub dispatch_index {
    my ($class, $req) = @_;
    return 'Root#index';
}

1;
