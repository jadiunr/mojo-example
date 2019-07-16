package MojoExample::Web::Controller::Example;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub welcome {
  my $self = shift;

  # Render template "example/welcome.html.ep" with message
  $self->render(json => {status => 'ok(まことに〜？？？)'});
}

1;
