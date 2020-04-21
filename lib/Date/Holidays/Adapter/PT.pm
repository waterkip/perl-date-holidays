package Date::Holidays::Adapter::PT;

use strict;
use warnings;

use base 'Date::Holidays::Adapter';

use vars qw($VERSION);

$VERSION = '1.20';

sub holidays {
    my ($self, %params) = @_;

    my $dh = $self->{_adaptee}->new();

    if ($dh) {
        return $dh->holidays($params{'year'});
    } else {
        return;
    }
}

sub is_holiday {
    my ($self, %params) = @_;

    my $dh = $self->{_adaptee}->new();

    if ($dh) {
        return $dh->is_holiday($params{'year'}, $params{'month'}, $params{'day'});
    } else {
        return '';
    }
}

1;

__END__

=pod

=head1 NAME

Date::Holidays::Adapter::PT - an adapter class for Date::Holidays::PT

=head1 VERSION

This POD describes version 1.20 of Date::Holidays::Adapter::PT

=head1 DESCRIPTION

The is the adapter class for L<Date::Holidays::PT>.

=head1 SUBROUTINES/METHODS

=head2 new

The constructor, takes a single named argument, B<countrycode>

=head2 is_holiday

The B<holidays> method, takes 3 named arguments, B<year>, B<month> and B<day>

Returns an indication of whether the day is a holiday in the calendar of the
country referenced by B<countrycode> in the call to the constructor B<new>.

=head2 holidays

The B<holidays> method, takes a single named argument, B<year>

Returns a reference to a hash holding the calendar of the country referenced by
B<countrycode> in the call to the constructor B<new>.

The calendar will spand for a year and the keys consist of B<month> and B<day>
concatenated.

=head1 DIAGNOSTICS

Please refer to DIAGNOSTICS in L<Date::Holidays>

=head1 DEPENDENCIES

=over

=item * L<Date::Holidays::PT>

=item * L<Date::Holidays::Adapter>

=back

=head1 INCOMPATIBILITIES

Please refer to INCOMPATIBILITIES in L<Date::Holidays>

=head1 BUGS AND LIMITATIONS

The adapter does not implement the B<is_pt_holiday> method. The pattern used is
an object adapter pattern and inheritance is therefor not used, it is my hope
that I can make this work with some Perl magic.

=head1 BUG REPORTING

Please refer to BUG REPORTING in L<Date::Holidays>

=head1 AUTHOR

Jonas B. Nielsen, (jonasbn) - C<< <jonasbn@cpan.org> >>

=head1 LICENSE AND COPYRIGHT

L<Date::Holidays> and related modules are (C) by Jonas B. Nielsen, (jonasbn)
2004-2020

Date-Holidays and related modules are released under the Artistic License 2.0

=cut
