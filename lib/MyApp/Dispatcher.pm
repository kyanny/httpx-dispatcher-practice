package MyApp::Dispatcher;
use strict;
use warnings;
use HTTPx::Dispatcher;

connect '' => { controller => 'Root', action => 'index' };
connect 'foo/bar' => { controller => 'Foo', action => 'bar' };
connect 'hoge/:action' => { controller => 'Hoge' };

1;
