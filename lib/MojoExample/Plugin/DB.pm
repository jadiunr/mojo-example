package MojoExample::Plugin::DB;
use Mojo::Base 'Mojolicious::Plugin';
use MojoExample::DB;

sub register {
    my ($self, $app) = @_;

    $app->helper(db => \&_db);
}

sub _db {
    my $c = shift;

    state $db = MojoExample::DB->new(connect_info => $c->config->{DBI});
}

1;