package UNIVERSAL::tap;

use 5.008_001;
use strict;
use warnings;
use UNIVERSAL ();

our $VERSION = '0.01';

sub tap {
    my $self = shift;
    my $code = shift || sub {};

    $code->($self) if ref($code) eq 'CODE';

    return $self;
}

{
    no warnings 'redefine';
    *UNIVERSAL::tap = \&tap;
}

1;

=head1 NAME

UNIVERSAL::tap - Ruby's tap()

=head1 SYNOPSIS

    use UNIVERSAL::tap;

    package MyClass;
    use base 'Class::Accessor::Fast';
    __PACKAGE__->mk_accessors('foo', 'bar');

    package main;

    my $obj = MyClass->new->tap(sub {
        my $self = shift;
        $self->foo('baz');
        $self->bar('quux');
    });

    print $obj->foo; # => 'baz'
    print $obj->bar; # => 'quux'

=head1 DESCRIPTION

This module exports tap() into every modules.

=head1 METHODS

=head2 tap

This method evaluates code block with instance as an argument,
and returns instance.

    $module->tap(sub { ... })->method_defined_in_module;

=head1 AUTHOR

NAKAGAWA Masaki E<lt>masaki@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
