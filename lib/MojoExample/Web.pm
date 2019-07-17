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

    # Load Helper Plugin
    $self->plugin('MojoExample::Plugin::DB');
    $self->plugin('MojoExample::Plugin::Auth');

    # Router
    my $r = $self->routes;

    # Root
    $r->get('/')->to('Example#welcome');

    # Task resource
    my $tasks = $r->under('/tasks' => sub {
        my $c = shift;
        my $token = $c->param('Authentication') =~ s/Bearer //r;

        eval { return 1 if $c->auth->verify_token($token) };

        $c->render(json => {error => 'Unauthenticated'}, status => 401);
        return undef;
    });
    $tasks->get->to('Tasks#index');
    $tasks->post->to('Tasks#create');
}

1;
