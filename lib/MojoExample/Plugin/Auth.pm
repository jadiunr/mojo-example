package MojoExample::Plugin::Auth;
use Mojo::Base 'Mojolicious::Plugin';

sub register {
    my ($self, $app) = @_;

    $app->helper(auth => \&_auth);
}

sub _auth {
    my $c = shift;

    state $auth = MojoExample::Plugin::Auth::Token->new(secret => $c->config->{secrets}[0]);
}

package MojoExample::Plugin::Auth::Token;
use Mojo::Base -base;
use Mojo::JWT;

has 'secret';

sub verify_token {
    my ($self, $token) = @_;

    return Mojo::JWT->new(secret => $self->secret)->decode($token);
}

sub generate_token {
    my ($self, $user_id) = @_;

    return Mojo::JWT->new(
        secret => $self->secret,
        claims => {user_id => $user_id},
        expires => time + 86400
    )->encode;
}

1;