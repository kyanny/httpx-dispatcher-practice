package MyApp::Controller::Foo;
use strict;
use warnings;

sub dispatch_bar {
    my ($class, $req) = @_;
    return 'Foo#bar';
}

1;
