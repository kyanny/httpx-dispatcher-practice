#!/usr/bin/env perl
use strict;
use warnings;
use lib 'lib';
use MyApp::Dispatcher;
use HTTP::Engine;
use UNIVERSAL::require;

my $engine = HTTP::Engine->new({
    interface => {
        module => 'ServerSimple',
        args => {
            host => 'localhost',
            port => '1980',
        },
        request_handler => \&handler,
    },
});
$engine->run;

sub handler {
    my $req = shift;
    my $rule = MyApp::Dispatcher->match($req);
    my $controller = 'MyApp::Controller::' . $rule->{controller};
    $controller->use;
    if ($@) {
        warn $@;
        return HTTP::Engine::Response->new(body => '');
    }
    else {
        my $action = 'dispatch_' . $rule->{action};
        my $body = $controller->$action($req);
        return HTTP::Engine::Response->new(body => $body);
    }
}
