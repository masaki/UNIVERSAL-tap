use strict;
use Test::More;
use UNIVERSAL::tap;

{
    package MyClass;

    sub new { bless { foo => undef, bar => undef }, shift }

    sub foo {
        $_[0]->{foo} = $_[1] if defined $_[1];
        $_[0]->{foo};
    }

    sub bar {
        $_[0]->{bar} = $_[1] if defined $_[1];
        $_[0]->{bar};
    }
}

my $obj = MyClass->new->tap(
    sub {
        $_[0]->foo('foo');
        $_[0]->bar('bar');
    }
);

is $obj->foo => 'foo';
is $obj->bar => 'bar';

done_testing;
