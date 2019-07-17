package MojoExample::DB::Filter;
use Mojo::Base -strict;
use Aniki::Filter::Declare;
use DateTime::Format::MySQL;

trigger insert => sub {
    my ($row, $next) = @_;

    $row->{created_at} = DateTime::Format::MySQL->format_datetime(DateTime->now);
    $row->{updated_at} = DateTime::Format::MySQL->format_datetime(DateTime->now);

    return $next->($row);
};

trigger update => sub {
    my ($row, $next) = @_;

    $row->{updated_at} = DateTime::Format::MySQL->format_datetime(DateTime->now);

    return $next->($row);
};