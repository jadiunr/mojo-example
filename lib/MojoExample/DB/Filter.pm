package MojoExample::DB::Filter;
use Mojo::Base -strict;
use Aniki::Filter::Declare;
use Mojo::Date;

trigger insert => sub {
    my ($row, $next) = @_;

    $row->{created_at} = Mojo::Date->new;
    $row->{updated_at} = Mojo::Date->new;

    return $next->($row);
};

trigger update => sub {
    my ($row, $next) = @_;

    $row->{updated_at} = Mojo::Date->new;

    return $next->($row);
};