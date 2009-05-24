package MyApp::Controller::Hoge;
use strict;
use warnings;

sub dispatch_hoge {
    my ($class, $req) = @_;
    return $class . '#' . $req->path;
}

sub dispatch_moe {
    my ($class, $req) = @_;
    return $class . '#' . $req->path;
}

1;
