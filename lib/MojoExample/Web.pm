package MojoExample::Web;
use Mojo::Base 'Mojolicious';

# This method will run once at server start
sub startup {
  my $self = shift;

  # Load configuration from hash returned by config file
  die 'MOJO_MODE env is undefined.' unless $ENV{MOJO_MODE};
  my $config = $self->plugin(Config => {file => "config/$ENV{MOJO_MODE}.pl"});

  # Configure the application
  $self->secrets($config->{secrets});

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('Example#welcome');
}

1;
