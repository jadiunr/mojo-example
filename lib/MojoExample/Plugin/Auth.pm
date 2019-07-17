package MojoExample::Plugin::Auth;
use Mojo::Base 'Mojolicious::Plugin';

sub register {
    my ($self, $app) = @_;

    $app->helper(auth => \&_auth);
}

sub _auth {
    my $c = shift;

    state $auth = MojoExample::Plugin::Auth::Token->new;
}

package MojoExample::Plugin::Auth::Token;
use Mojo::Base 'Mojolicious';
use Mojo::JWT;

sub verify_token {
    my ($self, $token) = @_;

    return $self;
}

1;